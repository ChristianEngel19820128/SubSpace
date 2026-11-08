
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant TEXTRESSOURCEERZ 0
#constant TEXTRESSOURCEBASEMATERIAL 1
#constant TEXTRESSOURCEMINERAL 2
#constant TEXTRESSOURCEHIGHTECHMATERIAL 3

#constant TEXTSPECIALFLEETPIRATE 0
#constant TEXTSPECIALFLEETTRANSPORT 1
#constant TEXTSPECIALFLEETSUPPORT 2
#constant TEXTSPECIALFLEETMERCHANT 3

#constant BUTTONFILTERFABRIK 0
#constant BUTTONFILTERKASERNE 1
#constant BUTTONFILTERGREENCRYSTAL 2
#constant BUTTONFILTERBLUECRYSTAL 3

#constant FILTERLIMITLOW 40
#constant FILTERLIMITHIGH 60

#constant FILTERLIMITBUILDINGLOW 1
#constant FILTERLIMITBUILDINGHIGH 2

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGalaxyView
	
	Body as TBody
	Color as TColor

	// basic images

	BackgroundImage as TImage
	FrameImage as TImage
	
	// info
	
	PlayerRessourceTextList as TText[-1]
	PlayerFleetTextList as TText[-1]
	
	// map

	SectorIconButton as TButton
	PlanetIconButton as TButton

	// button list filter
	
	FilterIndex as integer
	ButtonFilterList as TButton[-1]

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlayerRessourceTextCreate(GalaxyView ref as TGalaxyView)

	local Text as TText
	local i as integer
	local TextCoordinate as TCoordinate
	local Coordinate as TCoordinate
	local Size as TSize
	local Color as TColor

	GalaxyView.PlayerFleetTextList.Length = -1
	
	Coordinate.X = 800 
	Coordinate.Y = 500

	Size.Width = 32 + 5
	Size.Height = 0
	
	for i = 0 to 3

		TextCoordinate.X = GalaxyView.Body.Coordinate.X - Coordinate.X + Size.Width * i
		TextCoordinate.Y = GalaxyView.Body.Coordinate.Y - Coordinate.Y - Size.Height
	
		TextCreate(Text,TextCoordinate,28,ColorWhite)
	
		GalaxyView.PlayerRessourceTextList.Insert(Text)

	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlayerFleetTextCreate(GalaxyView ref as TGalaxyView)

	local Text as TText
	local i as integer
	local TextCoordinate as TCoordinate
	local Coordinate as TCoordinate
	local Size as TSize
	local Color as TColor

	GalaxyView.PlayerFleetTextList.Length = -1
	
	Coordinate.X = 800 
	Coordinate.Y = 500

	Size.Width = 32 + 5
	Size.Height = 0
	
	for i = 0 to 3

		TextCoordinate.X = GalaxyView.Body.Coordinate.X + Coordinate.X - Size.Width * i
		TextCoordinate.Y = GalaxyView.Body.Coordinate.Y - Coordinate.Y - Size.Height
	
		TextCreate(Text,TextCoordinate,28,ColorWhite)
	
		GalaxyView.PlayerFleetTextList.Insert(Text)

	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewBackgroundImagesCreate(GalaxyView ref as TGalaxyView)

	ImageCreate(GalaxyView.BackgroundImage,"back.png",GalaxyView.Body,GalaxyView.Color)
	ImageCreate(GalaxyView.FrameImage,"frame.png",GalaxyView.Body,GalaxyView.Color)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewSectorIconButton(GalaxyView ref as TGalaxyView)

	local Button as TButton

	local Body as TBody

	Body.Coordinate.X = GalaxyView.Body.Coordinate.X
	Body.Coordinate.Y = GalaxyView.Body.Coordinate.Y

	Body.Scale.X = 1
	Body.Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_sector_frame.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGESELECTED,"gui_galaxy_sector_selectframe.png",Body,ColorSelected)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlanetIconButton(GalaxyView ref as TGalaxyView)

	local Button as TButton

	local Body as TBody

	Body.Coordinate.X = GalaxyView.Body.Coordinate.X
	Body.Coordinate.Y = GalaxyView.Body.Coordinate.Y

	Body.Scale.X = 1
	Body.Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"icon_planet_small.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"icon_planet_medium.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"icon_planet_big.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay",Body,ColorWhite)

	ButtonImageCreate(Button,BUTTONIMAGESELECTED,"icon_planet_big_selected.png",Body,ColorSelected)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewFilterButtonsCreate(GalaxyView ref as TGalaxyView)

	local Button as TButton

	local Body as TBody
	local Coordinate as TCoordinate
	local Size as TSize

	GalaxyView.ButtonFilterList.Length = -1
	GalaxyView.FilterIndex = -1
	
	Coordinate.X = 800
	Coordinate.Y = 500

	Size.Width =  32 - 5
	Size.Height = 0

	Body.Coordinate.X = GalaxyView.Body.Coordinate.X + Coordinate.X - Size.Width * BUTTONFILTERFABRIK
	Body.Coordinate.Y = GalaxyView.Body.Coordinate.Y + Coordinate.Y - Size.Height

	Body.Scale.X = 1
	Body.Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEBACK,"gui_galaxy_button_face.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"gui_galaxy_button_filterfabrik.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,ColorWhite)

	GalaxyView.ButtonFilterList.Insert(Button)

	Body.Coordinate.X = GalaxyView.Body.Coordinate.X + Coordinate.X - Size.Width * BUTTONFILTERKASERNE
	Body.Coordinate.Y = GalaxyView.Body.Coordinate.Y + Coordinate.Y - Size.Height

	Body.Scale.X = 1
	Body.Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEBACK,"gui_galaxy_button_face.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"gui_galaxy_button_filterkaserne.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,ColorWhite)

	GalaxyView.ButtonFilterList.Insert(Button)
	
	Body.Coordinate.X = GalaxyView.Body.Coordinate.X + Coordinate.X - Size.Width * BUTTONFILTERGREENCRYSTAL
	Body.Coordinate.Y = GalaxyView.Body.Coordinate.Y + Coordinate.Y - Size.Height

	Body.Scale.X = 1
	Body.Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEBACK,"gui_galaxy_button_face.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"gui_galaxy_button_filtercrystal.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,ColorWhite)

	GalaxyView.ButtonFilterList.Insert(Button)
	
	Body.Coordinate.X = GalaxyView.Body.Coordinate.X + Coordinate.X - Size.Width * BUTTONFILTERBLUECRYSTAL
	Body.Coordinate.Y = GalaxyView.Body.Coordinate.Y + Coordinate.Y - Size.Height

	Body.Scale.X = 1
	Body.Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEBACK,"gui_galaxy_button_face.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"gui_galaxy_button_filtercrystal.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay.png",Body,ColorWhite)

	GalaxyView.ButtonFilterList.Insert(Button)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewCreate(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)

	GalaxyView.Body.Coordinate.X = cx
	GalaxyView.Body.Coordinate.Y = cy

	GalaxyView.Body.Size.Width = vx
	GalaxyView.Body.Size.Height = vy

	GalaxyView.Body.Scale.X = 1
	GalaxyView.Body.Scale.Y = 1

	GalaxyViewBackgroundImagesCreate(GalaxyView)
	GalaxyViewFilterButtonsCreate(GalaxyView)

	GalaxyViewPlayerRessourceTextCreate(GalaxyView)
	GalaxyViewPlayerFleetTextCreate(GalaxyView)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewInit(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy)

	ImageSetColor(GalaxyView.FrameImage,Galaxy.PlayerColorList[FACTIONPLAYER])

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewDraw(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)
	
	local i as integer
	local k as integer

	ImageDraw(GalaxyView.BackgroundImage)
	ImageDraw(GalaxyView.FrameImage)
	
	for i = 0 to GalaxyView.PlayerRessourceTextList.Length
		TextDraw(GalaxyView.PlayerRessourceTextList[i])
	next i

	for i = 0 to GalaxyView.PlayerFleetTextList.Length
		TextDraw(GalaxyView.PlayerFleetTextList[i])
	next i

	for i = 0 to Galaxy.SectorList.Length
		GalaxyViewConfigSector(GalaxyView,Galaxy,i,Game)
		ButtonRefreshCoordinate(GalaxyView.SectorIconButton,Galaxy.SectorList[i].Coordinate)
		ButtonDraw(GalaxyView.SectorIconButton)
		for k = 0 to Galaxy.SectorList[i].PlanetList.Length
			GalaxyViewConfigPlanetFilter(GalaxyView,Galaxy,i,k,Game)
			ButtonRefreshCoordinate(GalaxyView.PlanetIconButton,Galaxy.SectorList[i].PlanetList[k].WorldCoordinate)
			ButtonDraw(GalaxyView.PlanetIconButton)
		next k
	next i
	
	for i = 0 to GalaxyView.ButtonFilterList.Length
		ButtonDraw(GalaxyView.ButtonFilterList[i])
	next i

	GameTimeDraw(Galaxy.GameTime)
	
endfunction

//--------------------------------------------------------------
//
//-------------------------------------------------------------

function GalaxyViewConfigSector(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Index as integer,Game ref as TGame)

	local i as integer

	for i = 0 to Game.SectorView.Length
		if Game.SectorView[i].Enabled = 1 and Game.SectorView[i].SectorListIndex = Index
			ButtonSelectedSet(GalaxyView.SectorIconButton)
		else
			ButtonUnSelectedSet(GalaxyView.SectorIconButton)
		endif
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewConfigPlanetFilter(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,i as integer,k as integer,Game ref as TGame)
	
	local PlanetImageSizeIndex as integer
	
	PlanetImageSizeIndex = 0

	Select GalaxyView.FilterIndex
		case FILTERFACTION	
			if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality < FILTERLIMITLOW
				PlanetImageSizeIndex = 0
			endif
			if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality >= FILTERLIMITLOW and Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality <= FILTERLIMITHIGH
				PlanetImageSizeIndex = 1
			endif
			if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality > FILTERLIMITHIGH
				PlanetImageSizeIndex = 2
			endif
		endcase
		case FILTERFABRIK
			if Galaxy.SectorList[i].PlanetList[k].FabrikCount < FILTERLIMITBUILDINGLOW
				PlanetImageSizeIndex = 0
			endif
			if Galaxy.SectorList[i].PlanetList[k].FabrikCount >= FILTERLIMITBUILDINGLOW and Galaxy.SectorList[i].PlanetList[k].FabrikCount <= FILTERLIMITBUILDINGHIGH
				PlanetImageSizeIndex = 1
			endif
			if Galaxy.SectorList[i].PlanetList[k].FabrikCount > FILTERLIMITBUILDINGHIGH
				PlanetImageSizeIndex = 2
			endif
		endcase
		case FILTERKASERNE
			if Galaxy.SectorList[i].PlanetList[k].KaserneCount < FILTERLIMITBUILDINGLOW
				PlanetImageSizeIndex = 0
			endif
			if Galaxy.SectorList[i].PlanetList[k].KaserneCount >= FILTERLIMITBUILDINGLOW and Galaxy.SectorList[i].PlanetList[k].KaserneCount <= FILTERLIMITBUILDINGHIGH
				PlanetImageSizeIndex = 1
			endif
			if Galaxy.SectorList[i].PlanetList[k].KaserneCount > FILTERLIMITBUILDINGHIGH
				PlanetImageSizeIndex = 2
			endif
		endcase
		case FILTERCRYSTAL
			if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = 0
				PlanetImageSizeIndex = 0
			endif
			if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel > 0 and Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel <= FILTERLIMITLOW
				PlanetImageSizeIndex = 1
			endif
			if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel > FILTERLIMITLOW
				PlanetImageSizeIndex = 2
			endif
		endcase
	endselect
	
	if Game.PlanetView.Enabled = 1 and Game.PlanetView.SectorListIndex = i and Game.PlanetView.PlanetListIndex = k
		ButtonSelectedSet(GalaxyView.PlanetIconButton)
	else
		ButtonUnSelectedSet(GalaxyView.PlanetIconButton)
		ButtonImageSet(GalaxyView.PlanetIconButton,BUTTONIMAGEFRONT,PlanetImageSizeIndex)
		ButtonRefreshColor(GalaxyView.PlanetIconButton,BUTTONIMAGEFRONT,Galaxy.PlayerColorList[Galaxy.SectorList[i].PlanetList[k].Faction.FactionType])
	endif
			
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewSectorInput(SectorView ref as TSectorView,Game ref as TGame,SectorViewIndex as integer,Position as integer)
	
	local i as integer
	local Value as integer
	local CounterIndex as integer
	
	Value = 0
		
		if SectorViewIndex = 1
				CounterIndex = 0
			else
				CounterIndex = 1
			endif
			
	for i = 0 to Game.Galaxy.SectorList.Length

			
			
				if MouseOver(Game.Mouse,Game.Galaxy.SectorList[i].Coordinate,Game.Galaxy.Size.Sector) = 1
					if MouseClick(Game.Mouse) = 1						
						MouseRefresh(Game.Mouse)						

															
								if Game.SectorView[CounterIndex].Enabled = 0 or (Game.SectorView[CounterIndex].Enabled = 1 and Game.SectorView[CounterIndex].SectorListIndex <> i)
									SectorViewEnable(SectorView,SectorViewIndex,i,Position,Game)
									Value = 1
								endif
					

					endif
				endif
		
	next i

endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewInput(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Mouse ref as TMouse,Game ref as TGame)
	
	local Coordinate as TCoordinate
	local Size as TSize
	local i as integer
	
	GameTimeCheckSkipDay(Galaxy.GameTime,Mouse)
	
	if Game.PlanetView.Enabled = 1
		GalaxyViewSectorInput(Game.SectorView[0],Game,0,0)
		Game.SectorView[1].Enabled = 0
	else
		if Game.SectorView[0].Enabled = 0
			if Game.SectorView[1].Enabled = 0
				GalaxyViewSectorInput(Game.SectorView[0],Game,0,0)
			else
				// enabled [1]
				if Game.ModeSectorViewAutoSort = 0
					if GalaxyViewSectorInput(Game.SectorView[0],Game,0,0) = 1 
						if Galaxy.SectorList[Game.SectorView[0].SectorListIndex].Coordinate.X < Galaxy.SectorList[Game.SectorView[1].SectorListIndex].Coordinate.X
							Game.SectorView[0].Position = 0
							SectorViewPlanetPosSet(Game.SectorView[0],Game)
							SectorViewRefresh(Game.SectorView[0],Game)
							Game.SectorView[1].Position = 1
							SectorViewPlanetPosSet(Game.SectorView[1],Game)
							SectorViewRefresh(Game.SectorView[1],Game)
						else
							Game.SectorView[0].Position = 1
							SectorViewPlanetPosSet(Game.SectorView[0],Game)
							SectorViewRefresh(Game.SectorView[0],Game)
							Game.SectorView[1].Position = 0
							SectorViewPlanetPosSet(Game.SectorView[1],Game)
							SectorViewRefresh(Game.SectorView[1],Game)
						endif
					endif
				else
					if Game.SectorView[1].Position = 0
						GalaxyViewSectorInput(Game.SectorView[0],Game,0,1)
					else
						GalaxyViewSectorInput(Game.SectorView[0],Game,0,0)
					endif
				endif
			endif
		else
			// enabled [0]
			if Game.SectorView[1].Enabled = 0
				if Game.ModeSectorViewAutoSort = 0
					if GalaxyViewSectorInput(Game.SectorView[1],Game,1,1) = 1
						if Galaxy.SectorList[Game.SectorView[0].SectorListIndex].Coordinate.X < Galaxy.SectorList[Game.SectorView[1].SectorListIndex].Coordinate.X
							Game.SectorView[0].Position = 0
							SectorViewPlanetPosSet(Game.SectorView[0],Game)
							SectorViewRefresh(Game.SectorView[0],Game)
							Game.SectorView[1].Position = 1
							SectorViewPlanetPosSet(Game.SectorView[1],Game)
							SectorViewRefresh(Game.SectorView[1],Game)
						else
							Game.SectorView[0].Position = 1
							SectorViewPlanetPosSet(Game.SectorView[0],Game)
							SectorViewRefresh(Game.SectorView[0],Game)
							Game.SectorView[1].Position = 0
							SectorViewPlanetPosSet(Game.SectorView[1],Game)
							SectorViewRefresh(Game.SectorView[1],Game)
						endif					
					endif
				else
					if Game.SectorView[0].Position = 0
						GalaxyViewSectorInput(Game.SectorView[1],Game,1,1)
					else
						GalaxyViewSectorInput(Game.SectorView[1],Game,1,0)
					endif
				endif
			else
				// enabled [0][1]
				if Game.ModeSectorViewAutoSort = 0
					if GalaxyViewSectorInput(Game.SectorView[1],Game,1,1) = 1
						if Galaxy.SectorList[Game.SectorView[0].SectorListIndex].Coordinate.X < Galaxy.SectorList[Game.SectorView[1].SectorListIndex].Coordinate.X
							Game.SectorView[0].Position = 0
							Game.SectorView[1].Position = 1
							SectorViewPlanetPosSet(Game.SectorView[0],Game)
							SectorViewPlanetPosSet(Game.SectorView[1],Game)
							SectorViewRefresh(Game.SectorView[0],Game)
							SectorViewRefresh(Game.SectorView[1],Game)
						else
							Game.SectorView[0].Position = 1
							Game.SectorView[1].Position = 0
							SectorViewPlanetPosSet(Game.SectorView[0],Game)
							SectorViewPlanetPosSet(Game.SectorView[1],Game)
							SectorViewRefresh(Game.SectorView[0],Game)
							SectorViewRefresh(Game.SectorView[1],Game)
						endif
					endif
				endif
			endif
		endif
	endif
	
	if ButtonHit(Mouse,GalaxyView.ButtonFilterFabrik) = 1
		MouseRefresh(Mouse)
		if GalaxyView.FilterIndex = FILTERFABRIK
			GalaxyView.FilterIndex = FILTERFACTION
			GalaxyViewRefresh(GalaxyView,Game)
		else
			GalaxyView.FilterIndex = FILTERFABRIK
			GalaxyViewRefresh(GalaxyView,Game)
		endif
	endif
	
	if ButtonHit(Mouse,GalaxyView.ButtonFilterKaserne) = 1
		MouseRefresh(Mouse)
		if GalaxyView.FilterIndex = FILTERKASERNE
			GalaxyView.FilterIndex = FILTERFACTION
			GalaxyViewRefresh(GalaxyView,Game)
		else
			GalaxyView.FilterIndex = FILTERKASERNE
			GalaxyViewRefresh(GalaxyView,Game)
		endif
	endif
	
	if ButtonHit(Mouse,GalaxyView.ButtonFilterCrystal) = 1
		MouseRefresh(Mouse)
		if GalaxyView.FilterIndex = FILTERCRYSTAL
			GalaxyView.FilterIndex = FILTERFACTION
			GalaxyViewRefresh(GalaxyView,Game)
		else
			GalaxyView.FilterIndex = FILTERCRYSTAL
			GalaxyViewRefresh(GalaxyView,Game)
		endif
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


