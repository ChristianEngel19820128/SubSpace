
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSector
	
	Coordinate as TCoordinate
	
	PlanetList as TPlanet[-1]
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorClear(Sector ref as TSector)
	
	Sector.PlanetList.Length = -1
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorRandomCreate(NewSector ref as TSector,SectorIndex as integer,Coordinate ref as TCoordinate,Game ref as TGame)
	
	local i as integer
	local NewPlanet as TPlanet
	local PlanetCount as integer
	local PlanetCoordinate as TCoordinate
	local Count as integer
	
	NewSector.Coordinate = Coordinate	
	
	PlanetCount = random(Game.Galaxy.Data.MinPlanetCount/floor(SectorIndex*0.2+1),Game.Galaxy.Data.MaxPlanetCount/floor(SectorIndex*0.2+1))
	
	for i = 0 to PlanetCount
		
		Count = 0
		repeat
			PlanetCoordinate.X = random(Game.Galaxy.Size.Planet.Width,Game.Galaxy.Size.Sector.Width-Game.Galaxy.Size.Planet.Width)
			PlanetCoordinate.Y = random(Game.Galaxy.Size.Planet.Height,Game.Galaxy.Size.Sector.Height-Game.Galaxy.Size.Planet.Height)
			inc Count
		until CheckPlanetPosition(NewSector,PlanetCoordinate,Game.Galaxy.Size) = 1 or Count > 40
		
		if Count <= 40
			PlanetClear(NewPlanet)
			PlanetRandomCreate(NewPlanet,SectorIndex,NewSector.PlanetList.Length+1,NewSector.Coordinate,PlanetCoordinate,Game)
			NewSector.PlanetList.Insert(NewPlanet)
		endif
		
	next i
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function CheckPlanetPosition(Sector ref as TSector,PlanetCoordinate ref as TCoordinate,GalaxySize ref as TGalaxySize)
	
	local Value as integer
	local i as integer
	
	Value = 1
	for i = 0 to Sector.PlanetList.Length
		if PlanetCoordinate.X+GalaxySize.Planet.Width*0.5 >= Sector.PlanetList[i].SectorCoordinate.X - GalaxySize.Planet.Width*0.5
			if PlanetCoordinate.X-GalaxySize.Planet.Width*0.5 <= Sector.PlanetList[i].SectorCoordinate.X + GalaxySize.Planet.Width*0.5
				if PlanetCoordinate.Y+GalaxySize.Planet.Height*0.5 >= Sector.PlanetList[i].SectorCoordinate.Y - GalaxySize.Planet.Height*0.5
					if PlanetCoordinate.Y-GalaxySize.Planet.Height*0.5 <= Sector.PlanetList[i].SectorCoordinate.Y + GalaxySize.Planet.Height*0.5
						Value = 0
					endif
				endif
			endif
		endif
	next i
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

