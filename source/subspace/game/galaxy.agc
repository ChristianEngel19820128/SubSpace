
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGalaxySize
	
	Pos1Galaxy as TCoordinate
	Pos2Galaxy as TCoordinate
	
	Galaxy as TSize
	Sector as TSize
	Planet as TSize
	PlanetSector as TSize
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGalaxyData
	
	MinSectorCount as integer
	MaxSectorCount as integer
	
	MinPlanetCount as integer
	MaxPlanetCount as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGalaxy
	
	Size as TGalaxySize	
	Data as TGalaxyData
	
	GameTime as TGameTime
	
	SectorList as TSector[-1]
	FactionPlayerSectorList as TSector[-1]
	FactionEnemySectorList as TSector[-1]
	
	PlayerColorList as TColor[2]
	
	Player as TPlayer
	Enemy as TPlayer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyCreate(Galaxy ref as TGalaxy,Option ref as TOption,SectorView ref as TSectorView[],Game ref as TGame)

	GalaxySetSize(Galaxy.Size)
	GalaxySetData(Galaxy.Data,Option)

	GameTimeCreate(Galaxy.GameTime)

	PlayerCreate(Galaxy.Player)
	PlayerCreate(Galaxy.Enemy)
	
	Galaxy.SectorList.Length = -1
	Galaxy.FactionPlayerSectorList.Length = -1
	Galaxy.FactionEnemySectorList.Length = -1
	
	GalaxySectorListCreate(Galaxy,SectorView,Game)

	if Option.PlayerColor = 0
		Galaxy.PlayerColorList[FACTIONPLAYER] = ColorPlayer
		Galaxy.PlayerColorList[FACTIONENEMY] = ColorEnemy
	else
		Galaxy.PlayerColorList[FACTIONPLAYER] = ColorEnemy
		Galaxy.PlayerColorList[FACTIONENEMY] = ColorPlayer
	endif

	Galaxy.PlayerColorList[FACTIONNEUTRAL] = ColorNeutral

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxySetSize(Size ref as TGalaxySize)

	Size.Sector.Width = 160
	Size.Sector.Height = 160
	
	Size.Planet.Width = 35
	Size.Planet.Height = 35
	
	Size.Pos1Galaxy.X = 75 + Size.Sector.Width*0.5
	Size.Pos1Galaxy.Y = 120 + 45 + Size.Sector.Height*0.5
	
	Size.Pos2Galaxy.X = vx - 75 - Size.Sector.Width*0.5
	Size.Pos2Galaxy.Y = vy - 118 - Size.Sector.Height*0.5
	
	Size.Galaxy.Width = Size.Pos2Galaxy.X - Size.Pos1Galaxy.X
	Size.Galaxy.Height = Size.Pos2Galaxy.Y - Size.Pos1Galaxy.Y
	
	Size.PlanetSector.Width = Size.Planet.Width * 750 / Size.Sector.Width
	Size.PlanetSector.Height = Size.Planet.Height * 750 / Size.Sector.Height
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxySetData(Data ref as TGalaxyData,Option ref as TOption)
	
	Data.MinSectorCount = Option.GalaxyData.MinSectorCount
	Data.MaxSectorCount = Option.GalaxyData.MaxSectorCount
	
	Data.MinPlanetCount = Option.GalaxyData.MinPlanetCount
	Data.MaxPlanetCount = Option.GalaxyData.MaxPlanetCount
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxySectorListCreate(Galaxy ref as TGalaxy,SectorView ref as TSectorView[],Game ref as TGame)
	
	local i as integer
	local NewSector as TSector
	local Coordinate as TCoordinate
	local Radius as float
	local Angle as float
	local Count1 as integer
	local Count2 as integer
	local SectorCount as integer
	
	// startwerte festlegen
	
	Radius = random(100,125)
	Angle = random(0,360)
	
	SectorCount = random(Galaxy.Data.MinSectorCount,Galaxy.Data.MaxSectorCount)
	
	// alle sektoren anlegen
	
	for i = 0 to SectorCount
		
		// koordinaten berechnen
		
		Count1 = 0
		repeat
			Count2 = 0
			repeat
				Coordinate.X = cx + cos(Angle)*(Radius+random(0,Galaxy.Size.Sector.Width)-Galaxy.Size.Sector.Width*0.5)*1.5
				Coordinate.Y = cy + sin(Angle)*(Radius+random(0,Galaxy.Size.Sector.Height)-Galaxy.Size.Sector.Height*0.5)*0.4
				inc Count2
			until CheckSectorPosition(Galaxy,Coordinate) = 1 or Count2 > 35
			Angle = Angle+10
			Radius = Radius+random(3,6)
			inc Count1
		until Count1 > 10 or Count2 <= 35
		
		// sektor erzeugen und liste befüllen
		
		if Count2 <= 35
			SectorClear(NewSector)
			SectorRandomCreate(NewSector,i,Coordinate,Game)
			Galaxy.SectorList.Insert(NewSector)
			Galaxy.FactionPlayerSectorList.Insert(NewSector)
			Galaxy.FactionEnemySectorList.Insert(NewSector)
		endif
		
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function CheckSectorPosition(Galaxy ref as TGalaxy,Coordinate ref as TCoordinate)
	
	local Value as integer
	local i as integer
	
	Value = 1
	
	if Coordinate.X <= Galaxy.Size.Pos1Galaxy.X or Coordinate.X => Galaxy.Size.Pos2Galaxy.X or Coordinate.Y <= Galaxy.Size.Pos1Galaxy.Y or Coordinate.Y => Galaxy.Size.Pos2Galaxy.Y
		Value = 0
	endif
	
	if Value = 1
		for i = 0 to Galaxy.SectorList.Length
			if Coordinate.X+Galaxy.Size.Sector.Width*0.5 >= Galaxy.SectorList[i].Coordinate.X - Galaxy.Size.Sector.Width*0.5
				if Coordinate.X-Galaxy.Size.Sector.Width*0.5 <= Galaxy.SectorList[i].Coordinate.X + Galaxy.Size.Sector.Width*0.5
					if Coordinate.Y+Galaxy.Size.Sector.Height*0.5 >= Galaxy.SectorList[i].Coordinate.Y - Galaxy.Size.Sector.Height*0.5
						if Coordinate.Y-Galaxy.Size.Sector.Height*0.5 <= Galaxy.SectorList[i].Coordinate.Y + Galaxy.Size.Sector.Height*0.5
							Value = 0
						endif
					endif
				endif
			endif
		next i
	endif

endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyDo(Galaxy ref as TGalaxy,Game ref as TGame)
	
	local i as integer
	local k as integer
	local a as float
	local b as float
	local c as float
	local d as float
	local e as float
	local f as float
	
	if GameTimeCheck(Galaxy.GameTime) = 1
	
		for i = 0 to Galaxy.SectorList.Length
			for k = 0 to Galaxy.SectorList[i].PlanetList.Length
				if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel < 100
					
					if random(0,10000/Galaxy.GameTime.Day) < Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel
						if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel < 100
							
							c = random(0,Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel)
							d = c * 0.01
							Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel = Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + d
							Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel - d
							
							if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel > 100
								Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = 100 - Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel
							endif
							
							if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel > 100
								Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel = 100
							endif
							
							if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel < 0
								Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = 0
							endif
						
							//SectorViewRefresh(Game.SectorView[0],Game)
							//SectorViewRefresh(Game.SectorView[1],Game)
							
						endif
					endif
					
					if random(0,10000/Galaxy.GameTime.Day) < Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel
						
						a = Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel
						b = random(0,a)
						c = b * 0.01
						d = Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel
						e = d + c
						Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel = e
						f = a - c
						Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = f
						
						if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel > 100
							Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel = 100
						endif
						
						if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel < 0
							Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = 0
						endif
						
						//SectorViewRefresh(Game.SectorView[0],Game)
						//SectorViewRefresh(Game.SectorView[1],Game)
						
					endif
						
				endif
			next k
		next i
	
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



