
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TPlanet
	
	SectorListIndex as integer
	PlanetListIndex as integer
	
	PlanetIndex as integer
	
	GalaxyCoordinate as TCoordinate
	SectorCoordinate as TCoordinate
	WorldCoordinate as TCoordinate
	
	Body as TBody
	Color as TColor
	
	Name as string
	Description as string
	
	Faction as TFaction
	
	Loyality as integer
	Moral as integer
	
	MaxBuildingCount as integer
	BuildingList as TBuilding[-1]
	MaxBuildingOrbitalCount as integer
	BuildingOrbitalList as TBuildingOrbital[-1]
	
	FabrikCount as integer
	KaserneCount as integer
	
	MaxEnergyCount as integer
	EnergyCount as integer
	
	MaxRessourceCount as integer
	RessourceCount as integer
	
	Crystal as TCrystal
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetClear(Planet ref as TPlanet)
	
	local i as integer
	
	for i = 0 to Planet.BuildingList.Length
		Planet.BuildingList[i].BuildingAddonList.Length = -1
	next i
	Planet.BuildingList.Length = -1
	
	for i = 0 to Planet.BuildingOrbitalList.Length
		Planet.BuildingOrbitalList[i].BuildingAddonList.Length = -1
	next i
	Planet.BuildingOrbitalList.Length = -1
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetWorldPosSet(NewPlanet ref as TPlanet,x as float,y as float)

	NewPlanet.WorldCoordinate.X = x
	NewPlanet.WorldCoordinate.Y = y
			
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetRandomCreate(NewPlanet ref as TPlanet,SectorListIndex as integer,PlanetListIndex as integer,SectorCoordinate ref as TCoordinate,Coordinate ref as TCoordinate,Game ref as TGame)
	
	NewPlanet.SectorListIndex = SectorListIndex
	NewPlanet.PlanetListIndex = PlanetListIndex
	
	NewPlanet.PlanetIndex = random(0,Game.PlanetImages.ImageList.Length)
	
	NewPlanet.SectorCoordinate.X = Coordinate.X
	NewPlanet.SectorCoordinate.Y = Coordinate.Y
	
	NewPlanet.GalaxyCoordinate.X = SectorCoordinate.X - Game.Galaxy.Size.Sector.Width*0.5 + Coordinate.X
	NewPlanet.GalaxyCoordinate.Y = SectorCoordinate.Y - Game.Galaxy.Size.Sector.Height*0.5 + Coordinate.Y
	
	NewPlanet.WorldCoordinate.X = 0
	NewPlanet.WorldCoordinate.Y = 0
			
	NewPlanet.Body.Size = Game.PlanetImages.ImageList[NewPlanet.PlanetIndex].Image.Body.Size
	
	NewPlanet.MaxBuildingCount = random(3,7)
	NewPlanet.MaxBuildingOrbitalCount = 7
	
	NewPlanet.FabrikCount = 0
	NewPlanet.KaserneCount = 0
	
	NewPlanet.MaxEnergyCount = random(1,14)
	NewPlanet.EnergyCount = 0
	NewPlanet.MaxRessourceCount = random(1,NewPlanet.MaxBuildingCount+1)
	NewPlanet.RessourceCount = 0
	NewPlanet.Crystal.CrystalGreenLevel = 0
	NewPlanet.Crystal.CrystalBlueLevel = 0
	if random(0,10000) < 500
		NewPlanet.Crystal.CrystalGreenLevel = random(0,25)
	endif
	if random(0,10000) < 250
		NewPlanet.Crystal.CrystalBlueLevel = random(0,25)
	endif

	NewPlanet.Faction.FactionType = FACTIONNEUTRAL
	if random(0,10000) < 1000 + 3000/floor(NewPlanet.SectorListIndex+1)
		NewPlanet.Faction.FactionType = random(0,1)
	endif
	
	NewPlanet.Loyality = random(0,100)
	if NewPlanet.Faction.FactionType = FACTIONNEUTRAL
		NewPlanet.Loyality = random(41,59)
	endif
	
	NewPlanet.Moral = random(0,100)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


