
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant FILTERFACTION 0
#constant FILTERFABRIK 1
#constant FILTERKASERNE 2
#constant FILTERCRYSTAL 3

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSectorView
	
	Enabled as integer
	Position as integer
	
	Body as TBody
	
	Frame as TFrame

	ButtonPlanet as TButton

	IconSlotImage as TImage

	FilterIndex as integer
	ButtonFilterList as TButton[-1]
	
	ImageFilter as TImage

	ButtonFabrik as TButton
	ButtonShip as TButton
	
	SectorListIndex as integer
	PlanetListIndex as integer
	
	SectorViewIndex as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewLoadImages(SectorView ref as TSectorView)
	
	local i as integer
	
	SectorView.BackgroundImageID[0] = LoadImage("sector0.png")
	SectorView.BackgroundImageID[1] = LoadImage("sector1.png")
	
	SectorView.BackgroundSpriteID[0] = CreateSprite(SectorView.BackgroundImageID[0])
	SectorView.BackgroundSpriteID[1] = CreateSprite(SectorView.BackgroundImageID[1])
	
	SetSpriteColor(SectorView.BackgroundSpriteID[0],255,255,255,200)
	SetSpriteColor(SectorView.BackgroundSpriteID[1],255,255,255,200)
	
	SectorView.BackgroundStarsImageID = LoadImage("sector_back.png")
	SectorView.BackgroundStarsSpriteID = CreateSprite(SectorView.BackgroundStarsImageID)
	
	SetSpriteOffset(SectorView.BackgroundSpriteID[0],GetSpriteWidth(SectorView.BackgroundSpriteID[0])*0.5,GetSpriteHeight(SectorView.BackgroundSpriteID[0])*0.5)
	SetSpriteOffset(SectorView.BackgroundSpriteID[1],GetSpriteWidth(SectorView.BackgroundSpriteID[1])*0.5,GetSpriteHeight(SectorView.BackgroundSpriteID[1])*0.5)
		
	SetSpriteOffset(SectorView.BackgroundStarsSpriteID,GetSpriteWidth(SectorView.BackgroundStarsSpriteID)*0.5,GetSpriteHeight(SectorView.BackgroundStarsSpriteID)*0.5)
	
	SetSpriteColor(SectorView.BackgroundStarsSpriteID,255,255,255,155)
	
	SectorViewPlanetLoadImages(SectorView)
	
	SectorView.PlanetFrameImageID = LoadImage("gui_galaxy_planet_frame.png")
	SectorView.PlanetFrameSpriteID = CreateSprite(SectorView.PlanetFrameImageID)
	SetSpriteOffset(SectorView.PlanetFrameSpriteID,GetSpriteWidth(SectorView.PlanetFrameSpriteID)*0.5,GetSpriteHeight(SectorView.PlanetFrameSpriteID)*0.5)
	
	SectorView.SelectFrameImageID = LoadImage("gui_galaxy_sector_selectframe.png")
	SectorView.SelectFrameSpriteID = CreateSprite(SectorView.SelectFrameImageID)
	SetSpriteOffset(SectorView.SelectFrameSpriteID,GetSpriteWidth(SectorView.SelectFrameSpriteID)*0.5,GetSpriteHeight(SectorView.SelectFrameSpriteID)*0.5)
	SetSpriteColor(SectorView.SelectFrameSpriteID,255,200,0,155)
	
	SectorView.IconSlotImageID = LoadImage("icon_slot.png")
	SectorView.IconSlotSpriteID = CreateSprite(SectorView.IconSlotImageID)
	SetSpriteOffset(SectorView.IconSlotSpriteID,GetSpriteWidth(SectorView.IconSlotSpriteID)*0.5,GetSpriteHeight(SectorView.IconSlotSpriteID)*0.5)
	
	
			
	SectorView.FilterImageID[0] = LoadImage("icon_planet_small.png")
	SectorView.FilterSpriteID[0] = CreateSprite(SectorView.FilterImageID[0])
	SetSpriteOffset(SectorView.FilterSpriteID[0],GetSpriteWidth(SectorView.FilterSpriteID[0])*0.5,GetSpriteHeight(SectorView.FilterSpriteID[0])*0.5)
	
	SectorView.FilterImageID[1] = LoadImage("icon_planet_medium.png")
	SectorView.FilterSpriteID[1] = CreateSprite(SectorView.FilterImageID[1])
	SetSpriteOffset(SectorView.FilterSpriteID[1],GetSpriteWidth(SectorView.FilterSpriteID[1])*0.5,GetSpriteHeight(SectorView.FilterSpriteID[1])*0.5)
	
	SectorView.FilterImageID[2] = LoadImage("icon_planet_big.png")
	SectorView.FilterSpriteID[2] = CreateSprite(SectorView.FilterImageID[2])
	SetSpriteOffset(SectorView.FilterSpriteID[2],GetSpriteWidth(SectorView.FilterSpriteID[2])*0.5,GetSpriteHeight(SectorView.FilterSpriteID[2])*0.5)
	
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewRefresh(SectorView ref as TSectorView,Game ref as TGame)
	
	local Coordinate as TCoordinate
	local Color as TColor
	local BackColor as TColor
	local FrontColor as TColor
	local i as integer
	
	if SectorView.Enabled = 1
		
		ColorSet(Color,255,100,55,255)
		ColorSet(BackColor,200,100,55,200)
		ColorSet(FrontColor,200,255,255,220)
		
		SetSpriteColor(SectorView.BackgroundSpriteID[0],Game.Galaxy.PlayerColor.Red,Game.Galaxy.PlayerColor.Green,Game.Galaxy.PlayerColor.Blue,Game.Galaxy.PlayerColor.Alpha)
		SetSpriteColor(SectorView.BackgroundSpriteID[1],Game.Galaxy.PlayerColor.Red,Game.Galaxy.PlayerColor.Green,Game.Galaxy.PlayerColor.Blue,Game.Galaxy.PlayerColor.Alpha)
		
		
		if SectorView.Position = 0
			Coordinate.X = vx * 0.25 + 375 - 30
		else
			Coordinate.X = vx * 0.75 + 375 - 30
		endif
		
		Coordinate.Y = cy - 375 -15
		
		ButtonRefresh(SectorView.ButtonClose,Coordinate,Game.Galaxy.PlayerColor,Game.Galaxy.PlayerColor)
		
		if SectorView.Position = 0
			Coordinate.X = vx * 0.25 + 375 - 30 - 32 - 5
		else
			Coordinate.X = vx * 0.75 + 375 - 30 - 32 - 5
		endif
		
		ButtonRefresh(SectorView.ButtonSwitch,Coordinate,Game.Galaxy.PlayerColor,Game.Galaxy.PlayerColor)
		
		ColorSet(Color,255,100,55,255)
		if SectorView.FilterIndex = FILTERFABRIK then ColorSet(Color,255,155,55,255)
	
		Coordinate.Y = cy + 375 - 25
		
		if SectorView.Position = 0
			Coordinate.X = vx * 0.25 + 375 - 30
		else
			Coordinate.X = vx * 0.75 + 375 - 30
		endif
		
		ButtonRefresh(SectorView.ButtonFilterFabrik,Coordinate,Color,FrontColor)
		
		ColorSet(Color,255,100,55,255)
		if SectorView.FilterIndex = FILTERKASERNE then ColorSet(Color,255,155,55,255)
		
		if SectorView.Position = 0
			Coordinate.X = vx * 0.25 + 375 - 30 - 32 - 5
		else
			Coordinate.X = vx * 0.75 + 375 - 30 - 32 - 5
		endif
		
		ButtonRefresh(SectorView.ButtonFilterKaserne,Coordinate,Color,FrontColor)
		
		ColorSet(Color,255,100,55,255)
		if SectorView.FilterIndex = FILTERCRYSTAL then ColorSet(Color,255,155,55,255)
		
		if SectorView.Position = 0
			Coordinate.X = vx * 0.25 + 375 - 30 - (32 + 5)*2 - 10
		else
			Coordinate.X = vx * 0.75 + 375 - 30 - (32 + 5)*2 - 10
		endif
		
		ButtonRefresh(SectorView.ButtonFilterCrystal,Coordinate,Color,FrontColor)
			
			
			
		if SectorView.ButtonFabrik.Length = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList.Length
			for i = 0 to Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList.Length
					
				select Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].Faction.FactionType
					case FACTIONPLAYER
						Coordinate.X = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.X + 45
						Coordinate.Y = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.Y - 35
						ButtonRefresh(SectorView.ButtonShip[i],Coordinate,BackColor,Game.Galaxy.PlayerColor)
						Coordinate.X = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.X + 25
						Coordinate.Y = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.Y + 10
						ButtonRefresh(SectorView.ButtonFabrik[i],Coordinate,BackColor,Game.Galaxy.PlayerColor)
					endcase
					case FACTIONENEMY
						Coordinate.X = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.X + 45
						Coordinate.Y = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.Y - 25
						ButtonRefresh(SectorView.ButtonShip[i],Coordinate,BackColor,Game.Galaxy.EnemyColor)
						Coordinate.X = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.X + 35
						Coordinate.Y = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.Y + 10
						ButtonRefresh(SectorView.ButtonFabrik[i],Coordinate,BackColor,Game.Galaxy.EnemyColor)
					endcase
					case FACTIONNEUTRAL
						Coordinate.X = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.X + 45
						Coordinate.Y = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.Y - 35
						ButtonRefresh(SectorView.ButtonShip[i],Coordinate,BackColor,Game.Galaxy.NeutralColor)
						Coordinate.X = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.X + 25
						Coordinate.Y = Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[i].WorldCoordinate.Y + 10
						ButtonRefresh(SectorView.ButtonFabrik[i],Coordinate,BackColor,Game.Galaxy.NeutralColor)
					endcase
				endselect
				
			next i
		endif
		
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewCreate(SectorView ref as TSectorView,Game ref as TGame)
	
	local Coordinate as TCoordinate
	local Size as TSize
	local BackColor as TColor
	local FrontColor as TColor
	local BackScale as TScale
	local FrontScale as TScale
	
	Size.Width = 32
	Size.Height = 32
	
	if SectorView.Position = 0
		Coordinate.X = vx * 0.25 + 375 - 30
	else
		Coordinate.X = vx * 0.75 + 375 - 30
	endif
	
	Coordinate.Y = cy - 375 - 15
	
	BackScale.X = 1
	BackScale.Y = 1
		
	FrontScale.X = 0.75
	FrontScale.Y = 0.75
	
	ButtonCreate(SectorView.ButtonClose,"gui_galaxy_button_face_metalic.png","gui_galaxy_button_close.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)
	ButtonCreate(SectorView.ButtonSwitch,"gui_galaxy_button_face_metalic.png","gui_galaxy_button_switch.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)
	
	BackScale.X = 1
	BackScale.Y = 1
	
	FrontScale.X = 1
	FrontScale.Y = 1
	
	ButtonCreate(SectorView.ButtonFilterFabrik,"gui_galaxy_button_face.png","gui_galaxy_button_filterfabrik.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)
	ButtonCreate(SectorView.ButtonFilterKaserne,"gui_galaxy_button_face.png","gui_galaxy_button_filterkaserne.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)
	ButtonCreate(SectorView.ButtonFilterCrystal,"gui_galaxy_button_face.png","gui_galaxy_button_filtercrystal.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewPlanetPosSet(SectorView ref as TSectorView,Game ref as TGame)
	
	local k as integer
	local x as float
	local y as float
	
	for k = 0 to Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList.Length

		if SectorView.Position = 0
			x = vx * 0.25 - 375 + Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[k].SectorCoordinate.X * 750 / 160
			y = cy - 375 + Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[k].SectorCoordinate.Y * 750 / 160
		else
			x = vx * 0.75 - 375 + Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[k].SectorCoordinate.X * 750 / 160
			y = cy - 375 + Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[k].SectorCoordinate.Y * 750 / 160
		endif
	
		PlanetWorldPosSet(Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList[k],x,y)
	
	next k
	
	SectorViewRefresh(SectorView,Game)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewEnable(SectorView ref as TSectorView,SectorViewIndex as integer,SectorListIndex as integer,Position as integer,Game ref as TGame)
	
	local i as integer
	local k as integer
	local x as float
	local y as float
	
	local Coordinate as TCoordinate
	local Size as TSize
	local BackColor as TColor
	local FrontColor as TColor
	local Button as TButton
	local BackScale as TScale
	local FrontScale as TScale
	
	SectorView.Enabled = 1
	SectorView.Position = Position
	SectorView.SectorViewIndex = SectorViewIndex
	SectorView.SectorListIndex = SectorListIndex
	
	SectorViewPlanetPosSet(SectorView,Game)
	
	SectorView.ButtonShip.Length = -1
	SectorView.ButtonFabrik.Length = -1
	Size.Width = 32
	Size.Height = 32
	BackScale.X = 1
	FrontScale.Y = 1
	for i = 0 to Game.Galaxy.SectorList[SectorView.SectorListIndex].PlanetList.Length
		ButtonCreate(Button,"0","gui_galaxy_button_filtership.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)
		SectorView.ButtonShip.Insert(Button)
		ButtonCreate(Button,"0","gui_galaxy_button_filterfabrik.png",Coordinate,Size,BackScale,FrontScale,BackColor,FrontColor)
		SectorView.ButtonFabrik.Insert(Button)
	next i
	
	SectorViewRefresh(SectorView,Game)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewInput(SectorView ref as TSectorView,SectorViewIndex as integer,PlanetList ref as TPlanet[],Mouse ref as TMouse,PlanetView ref as TPlanetView,Game ref as TGame)
	
	local i as integer
	local CounterIndex as integer
	
	if SectorView.Enabled = 1
		
		if SectorViewIndex = 0
			CounterIndex = 1
		else
			CounterIndex = 0
		endif
	
		for i = 0 to PlanetList.Length
			if MouseOver(Mouse,PlanetList[i].WorldCoordinate,SectorView.PlanetSize[PlanetList[i].PlanetIndex]) = 1
				if ButtonClick(Mouse,PlanetList[i].WorldCoordinate,SectorView.PlanetSize[PlanetList[i].PlanetIndex]) = 1
					MouseRefresh(Mouse)
					if SectorView.Position = 1
						SectorView.Position = 0
						SectorViewRefresh(Game.SectorView[SectorViewIndex],Game)
						SectorViewPlanetPosSet(Game.SectorView[SectorViewIndex],Game)
						Game.SectorView[CounterIndex].Enabled = 0
					endif
					SectorView.PlanetListIndex = i
					PlanetViewEnable(PlanetView,SectorView.SectorListIndex,SectorView.PlanetListIndex,i,Game)
				endif
			endif
		next i

	
		if ButtonHit(Mouse,SectorView.ButtonClose) = 1
			MouseRefresh(Mouse)
			SectorView.Enabled = 0
		endif
		
		if ButtonHit(Mouse,SectorView.ButtonSwitch) = 1
			MouseRefresh(Mouse)
			
			if Game.SectorView[SectorViewIndex].Position = 0
				Game.SectorView[SectorViewIndex].Position = 1
				Game.SectorView[CounterIndex].Position = 0
			else
				Game.SectorView[SectorViewIndex].Position = 0
				Game.SectorView[CounterIndex].Position = 1
			endif
			
			SectorViewRefresh(Game.SectorView[SectorViewIndex],Game)
			SectorViewRefresh(Game.SectorView[CounterIndex],Game)
			
			SectorViewPlanetPosSet(Game.SectorView[SectorViewIndex],Game)
			SectorViewPlanetPosSet(Game.SectorView[CounterIndex],Game)
			
		endif
		
		if ButtonHit(Mouse,SectorView.ButtonFilterFabrik) = 1
			MouseRefresh(Mouse)
			if SectorView.FilterIndex = FILTERFABRIK
				SectorView.FilterIndex = FILTERFACTION
				SectorViewRefresh(SectorView,Game)
			else
				SectorView.FilterIndex = FILTERFABRIK
				SectorViewRefresh(SectorView,Game)
			endif
		endif
		
		if ButtonHit(Mouse,SectorView.ButtonFilterKaserne) = 1
			MouseRefresh(Mouse)
			if SectorView.FilterIndex = FILTERKASERNE
				SectorView.FilterIndex = FILTERFACTION
				SectorViewRefresh(SectorView,Game)
			else
				SectorView.FilterIndex = FILTERKASERNE
				SectorViewRefresh(SectorView,Game)
			endif
		endif
		
		if ButtonHit(Mouse,SectorView.ButtonFilterCrystal) = 1
			MouseRefresh(Mouse)
			if SectorView.FilterIndex = FILTERCRYSTAL
				SectorView.FilterIndex = FILTERFACTION
				SectorViewRefresh(SectorView,Game)
			else
				SectorView.FilterIndex = FILTERCRYSTAL
				SectorViewRefresh(SectorView,Game)
			endif
		endif
		
		for i = 0 to SectorView.ButtonShip.Length
			if ButtonHit(Mouse,SectorView.ButtonShip[i]) = 1
				MouseRefresh(Mouse)
				
				SectorViewRefresh(SectorView,Game)
			endif
		next i
		
		for i = 0 to SectorView.ButtonFabrik.Length
			if ButtonHit(Mouse,SectorView.ButtonFabrik[i]) = 1
				MouseRefresh(Mouse)
				
				SectorViewRefresh(SectorView,Game)
			endif
		next i
		
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewInputDraw(SectorView ref as TSectorView,Sector ref as TSector,Mouse ref as TMouse)
	
	local i as integer
	
	if SectorView.Enabled = 1
		for i = 0 to Sector.PlanetList.Length
			if MouseOver(Mouse,Sector.PlanetList[i].WorldCoordinate,Sector.PlanetList[i].Size) = 1
				SetSpritePositionByOffset(SectorView.PlanetFrameSpriteID,Sector.PlanetList[i].WorldCoordinate.X,Sector.PlanetList[i].WorldCoordinate.Y)
				DrawSprite(SectorView.PlanetFrameSpriteID)
			endif
		next i
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewPlanetDraw(SectorView ref as TSectorView,Sector ref as TSector,GalaxySize ref as TGalaxySize,Game ref as TGame)
	
	local i as integer
	local x as float
	local y as float
	local k as integer
	local FilterSizeIndex as integer
	local max as integer
	local blue as integer
	local green as integer
	
	if SectorView.Enabled = 1
		for i = 0 to Sector.PlanetList.Length
			
			x = Sector.PlanetList[i].WorldCoordinate.X
			y = Sector.PlanetList[i].WorldCoordinate.Y
			
			PlanetImagesDraw(Game.PlanetImages,Sector.PlanetList[i].PlanetIndex,x,y,0)
			
			for k = 0 to 2
				Select Sector.PlanetList[i].Faction.FactionType
					case FACTIONPLAYER
						SetSpriteColor(SectorView.FilterSpriteID[k],Game.Galaxy.PlayerColor.Red,Game.Galaxy.PlayerColor.Green,Game.Galaxy.PlayerColor.Blue,Game.Galaxy.PlayerColor.Alpha)
					endcase
					case FACTIONENEMY
						SetSpriteColor(SectorView.FilterSpriteID[k],Game.Galaxy.EnemyColor.Red,Game.Galaxy.EnemyColor.Green,Game.Galaxy.EnemyColor.Blue,Game.Galaxy.EnemyColor.Alpha)
					endcase
					case FACTIONNEUTRAL
						SetSpriteColor(SectorView.FilterSpriteID[k],255,255,200,255)
					endcase
				endselect
			next k
					
			FilterSizeIndex = 0
			Select SectorView.FilterIndex
				case FILTERFACTION
					FilterSizeIndex = 2
				endcase
				case FILTERFABRIK
					if Sector.PlanetList[i].FabrikCount < 1
						FilterSizeIndex = 0
					endif
					if Sector.PlanetList[i].FabrikCount > 0 and Sector.PlanetList[i].FabrikCount < 3
						FilterSizeIndex = 1
					endif
					if Sector.PlanetList[i].FabrikCount > 2
						FilterSizeIndex = 2
					endif
				endcase
				case FILTERKASERNE
					if Sector.PlanetList[i].KaserneCount < 1
						FilterSizeIndex = 0
					endif
					if Sector.PlanetList[i].KaserneCount > 0 and Sector.PlanetList[i].KaserneCount < 3
						FilterSizeIndex = 1
					endif
					if Sector.PlanetList[i].KaserneCount > 2
						FilterSizeIndex = 2
					endif
				endcase
				case FILTERCRYSTAL
					if Sector.PlanetList[i].Crystal.CrystalBlueLevel = 0
						FilterSizeIndex = 0
					endif
					if Sector.PlanetList[i].Crystal.CrystalBlueLevel > 0 and Sector.PlanetList[i].Crystal.CrystalBlueLevel < 50
						FilterSizeIndex = 1
					endif
					if Sector.PlanetList[i].Crystal.CrystalBlueLevel > 49
						FilterSizeIndex = 2
					endif
				endcase
			endselect
			
			SetSpritePositionByOffset(SectorView.FilterSpriteID[FilterSizeIndex],x-13,y-13)
			DrawSprite(SectorView.FilterSpriteID[FilterSizeIndex])
			
			for k = 1 to Sector.PlanetList[i].MaxEnergyCount
				
				SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-Sector.PlanetList[i].MaxEnergyCount*8*0.5+k*8,y+35)
				
				if k <= Sector.PlanetList[i].EnergyCount
					SetSpriteColor(SectorView.IconSlotSpriteID,255,255,255,255)
				else
					SetSpriteColor(SectorView.IconSlotSpriteID,0,127,255,255)
				endif
				
				DrawSprite(SectorView.IconSlotSpriteID)
			
			next k
			
			for k = 0 to Sector.PlanetList[i].MaxBuildingOrbitalCount
				
				SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-(Sector.PlanetList[i].MaxBuildingOrbitalCount+Sector.PlanetList[i].MaxBuildingCount)*8*0.5+k*8+Sector.PlanetList[i].MaxBuildingCount*8,y+43)
				
				if k <= Sector.PlanetList[i].BuildingOrbitalList.Length
					SetSpriteColor(SectorView.IconSlotSpriteID,255,255,255,255)
				else
					SetSpriteColor(SectorView.IconSlotSpriteID,0,255,0,255)
				endif
				
				DrawSprite(SectorView.IconSlotSpriteID)
			
			next k
			
			for k = 0 to Sector.PlanetList[i].MaxBuildingCount
				
				SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-(Sector.PlanetList[i].MaxBuildingOrbitalCount+Sector.PlanetList[i].MaxBuildingCount)*8*0.5+k*8,y+51)
				
				if k <= Sector.PlanetList[i].BuildingList.Length
					if k < Ceil(Sector.PlanetList[i].MaxBuildingCount * 0.01 * (Sector.PlanetList[i].Crystal.CrystalBlueLevel + Sector.PlanetList[i].Crystal.CrystalGreenLevel))
						if k < Ceil(Sector.PlanetList[i].MaxBuildingCount * 0.01 * Sector.PlanetList[i].Crystal.CrystalBlueLevel)
							SetSpriteColor(SectorView.IconSlotSpriteID,255,0,0,255)
						else
							SetSpriteColor(SectorView.IconSlotSpriteID,255,0,0,255)
						endif
					else
						SetSpriteColor(SectorView.IconSlotSpriteID,255,255,255,255)
					endif
				else
					if k < Ceil(Sector.PlanetList[i].MaxBuildingCount * 0.01 * (Sector.PlanetList[i].Crystal.CrystalBlueLevel + Sector.PlanetList[i].Crystal.CrystalGreenLevel))
						if k < Ceil(Sector.PlanetList[i].MaxBuildingCount * 0.01 * Sector.PlanetList[i].Crystal.CrystalBlueLevel)
							SetSpriteColor(SectorView.IconSlotSpriteID,255,0,0,255)
						else
							SetSpriteColor(SectorView.IconSlotSpriteID,255,0,0,255)
						endif
					else
						SetSpriteColor(SectorView.IconSlotSpriteID,0,0,255,255)
					endif
				endif
				
				DrawSprite(SectorView.IconSlotSpriteID)
			
			next k
			
			for k = 1 to Sector.PlanetList[i].MaxRessourceCount
				
				SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-Sector.PlanetList[i].MaxRessourceCount*8*0.5+k*8,y+59)
				
				if k <= Sector.PlanetList[i].RessourceCount
					SetSpriteColor(SectorView.IconSlotSpriteID,255,255,255,255)
				else
					SetSpriteColor(SectorView.IconSlotSpriteID,255,155,0,255)
				endif
				
				DrawSprite(SectorView.IconSlotSpriteID)
			
			next k
			
			for k = 0 to 25
				
				SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-25*4*0.5+k*4,y+67)
				
				if k*4 < Sector.PlanetList[i].Loyality
					SetSpriteColor(SectorView.IconSlotSpriteID,Game.Galaxy.PlayerColor.Red,Game.Galaxy.PlayerColor.Green,Game.Galaxy.PlayerColor.Blue,Game.Galaxy.PlayerColor.Alpha)
				else
					SetSpriteColor(SectorView.IconSlotSpriteID,Game.Galaxy.EnemyColor.Red,Game.Galaxy.EnemyColor.Green,Game.Galaxy.EnemyColor.Blue,Game.Galaxy.EnemyColor.Alpha)
				endif
				
				DrawSprite(SectorView.IconSlotSpriteID)
			
			next k
			
			max = Ceil((Sector.PlanetList[i].Crystal.CrystalBlueLevel + Sector.PlanetList[i].Crystal.CrystalGreenLevel)*0.25^2)
			blue = Ceil(Sector.PlanetList[i].Crystal.CrystalBlueLevel*0.25^2)
			green = Ceil(Sector.PlanetList[i].Crystal.CrystalGreenLevel*0.25^2)
			
			if max = 0
				SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x,y+75)
				SetSpriteColor(SectorView.IconSlotSpriteID,255,255,255,255)
				DrawSprite(SectorView.IconSlotSpriteID)
			else
					
				for k = 1 to blue
					SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-max*0.5+k*4,y+75)
					SetSpriteColor(SectorView.IconSlotSpriteID,0,0,255,255)
					DrawSprite(SectorView.IconSlotSpriteID)
				next k
				
				for k = blue + 1 to green
					SetSpritePositionByOffset(SectorView.IconSlotSpriteID,x-max*0.5+k*4,y+75)
					SetSpriteColor(SectorView.IconSlotSpriteID,0,255,0,255)
					DrawSprite(SectorView.IconSlotSpriteID)
				next k
			
			endif
			
			SectorViewInputDraw(SectorView,Sector,Game.Mouse)
			
		next i
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewDraw(SectorView ref as TSectorView,Sector ref as TSector,GalaxySize ref as TGalaxySize,Game ref as TGame)
	
	local i as integer
	
	if SectorView.Enabled = 1
		
		SetSpritePositionByOffset(SectorView.SelectFrameSpriteID,Sector.Coordinate.X,Sector.Coordinate.Y)
		DrawSprite(SectorView.SelectFrameSpriteID)

		if SectorView.Position = 0
			SectorView.Size.Width = GetSpriteWidth(SectorView.BackgroundSpriteID[0])
			SectorView.Size.Height = GetSpriteHeight(SectorView.BackgroundSpriteID[0])
			SectorView.Coordinate.X = vx*0.25
			SectorView.Coordinate.Y = cy
			SetSpritePositionByOffset(SectorView.BackgroundSpriteID[0],SectorView.Coordinate.X,SectorView.Coordinate.Y)
		else
			SectorView.Size.Width = GetSpriteWidth(SectorView.BackgroundSpriteID[1])
			SectorView.Size.Height = GetSpriteHeight(SectorView.BackgroundSpriteID[1])
			SectorView.Coordinate.X = vx*0.75
			SectorView.Coordinate.Y = cy
			SetSpritePositionByOffset(SectorView.BackgroundSpriteID[1],SectorView.Coordinate.X,SectorView.Coordinate.Y)
		endif
		
		SetSpritePositionByOffset(SectorView.BackgroundStarsSpriteID,SectorView.Coordinate.X,SectorView.Coordinate.Y)
		
		DrawSprite(SectorView.BackgroundStarsSpriteID)
		
		if SectorView.Position = 0
			DrawSprite(SectorView.BackgroundSpriteID[0])
		else
			DrawSprite(SectorView.BackgroundSpriteID[1])
		endif
		
		SectorViewPlanetDraw(SectorView,Sector,GalaxySize,Game)
		
		ButtonDraw(SectorView.ButtonClose)
		ButtonDraw(SectorView.ButtonSwitch)
		ButtonDraw(SectorView.ButtonFilterFabrik)
		ButtonDraw(SectorView.ButtonFilterKaserne)
		ButtonDraw(SectorView.ButtonFilterCrystal)
		
		for i = 0 to SectorView.ButtonShip.Length
			ButtonDraw(SectorView.ButtonShip[i])
		next i
		
		for i = 0 to SectorView.ButtonFabrik.Length
			ButtonDraw(SectorView.ButtonFabrik[i])
		next i
		
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


