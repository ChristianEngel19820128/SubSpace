
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

#constant BUTTONFILTERNONE -1
#constant BUTTONFILTERFABRIK 0
#constant BUTTONFILTERKASERNE 1
#constant BUTTONFILTERGREENCRYSTAL 2
#constant BUTTONFILTERBLUECRYSTAL 3

#constant FILTERLIMITLOW 25
#constant FILTERLIMITMID 50
#constant FILTERLIMITHIGH 75

#constant FILTERLIMITBUILDINGLOW 1
#constant FILTERLIMITBUILDINGMID 2
#constant FILTERLIMITBUILDINGHIGH 3

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGalaxyView
	
	Body as TBody[0]
	Color as TColor

	// basic images

	BackgroundImage as TImage
	FrameImage as TImage
	
	// info
	
	PlayerRessourceTextList as TTextList
	PlayerFleetTextList as TTextList
	
	// map

	SectorButtonList as TButtonList
	PlanetButtonList as TButtonList

	// button list filter
	
	FilterIndex as integer
	ButtonFilterList as TButtonList

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlayerRessourceTextCreate(GalaxyView ref as TGalaxyView)

	local Text as TText
	local Body as TBody[0]
	local i as integer

	Body[0].AbsoluteCoordinate.X = GalaxyView.Body[0].AbsoluteCoordinate.X - 840 
	Body[0].AbsoluteCoordinate.Y = GalaxyView.Body[0].AbsoluteCoordinate.Y - 465

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	Body[0].Size.Width = 115
	Body[0].Size.Height = 35

	Body[0].Alignment.AlignmentType = ALIGNMENTRIGHT
	Body[0].Alignment.Horizontal = 11

	TextListCreate(GalaxyView.PlayerRessourceTextList,Body,28,ColorWhite)
	GalaxyView.PlayerRessourceTextList.Max = 4

	for i = 0 to 3
		TextListAddText(GalaxyView.PlayerRessourceTextList,"")
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlayerFleetTextCreate(GalaxyView ref as TGalaxyView)

	local Text as TText
	local Body as TBody[0]
	local i as integer

	Body[0].AbsoluteCoordinate.X = GalaxyView.Body[0].AbsoluteCoordinate.X + 840 
	Body[0].AbsoluteCoordinate.Y = GalaxyView.Body[0].AbsoluteCoordinate.Y - 465

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	Body[0].Size.Width = 115
	Body[0].Size.Height = 35

	Body[0].Alignment.AlignmentType = ALIGNMENTLEFT
	Body[0].Alignment.Horizontal = 11

	TextListCreate(GalaxyView.PlayerFleetTextList,Body,28,ColorWhite)
	GalaxyView.PlayerFleetTextList.Max = 4

	for i = 0 to 3
		TextListAddText(GalaxyView.PlayerFleetTextList,"")
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewBackgroundImagesCreate(GalaxyView ref as TGalaxyView,Game ref as TGame)

	ImageSet(GalaxyView.BackgroundImage,Game.FrameImages.ImageBack,GalaxyView.Body,GalaxyView.Color)
	ImageSet(GalaxyView.FrameImage,Game.FrameImages.ImageFrame,GalaxyView.Body,GalaxyView.Color)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewSectorButton(GalaxyView ref as TGalaxyView)

	local Button as TButton

	local Body as TBody[0]

	Body[0].AbsoluteCoordinate.X = GalaxyView.Body[0].AbsoluteCoordinate.X
	Body[0].AbsoluteCoordinate.Y = GalaxyView.Body[0].AbsoluteCoordinate.Y

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_sector_frame.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGESELECTED,"gui_galaxy_sector_selectframe.png",Body,ColorSelected)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlanetButton(GalaxyView ref as TGalaxyView)

	local Button as TButton

	local Body as TBody[0]

	Body[0].AbsoluteCoordinate.X = GalaxyView.Body[0].AbsoluteCoordinate.X
	Body[0].AbsoluteCoordinate.Y = GalaxyView.Body[0].AbsoluteCoordinate.Y

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"icon_planet_small.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"icon_planet_medium.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEFRONT,"icon_planet_big.png",Body,ColorWhite)
	ButtonImageCreate(Button,BUTTONIMAGEOVERLAY,"gui_galaxy_button_overlay",Body,ColorWhite)

	ButtonImageCreate(Button,BUTTONIMAGESELECTED,"icon_planet_big_selected.png",Body,ColorSelected)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewFilterButtonsCreate(GalaxyView ref as TGalaxyView,Game ref as TGame)

	local Button as TButton

	local Body as TBody[0]

	GalaxyView.FilterIndex = BUTTONFILTERNONE
	
	Body[0].AbsoluteCoordinate.X = GalaxyView.Body[0].AbsoluteCoordinate.X + 874
	Body[0].AbsoluteCoordinate.Y = GalaxyView.Body[0].AbsoluteCoordinate.Y + 460

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	Body[0].Size.Width = 0
	Body[0].Size.Height = 0

	Body[0].Alignment.AlignmentType = ALIGNMENTLEFT
	Body[0].Alignment.Horizontal = 10

	ButtonListCreate(GalaxyView.ButtonFilterList,Body,ColorWhite)
	GalaxyView.ButtonFilterList.Max = 4

	ButtonCreate(Button,BUTTONFILTERFABRIK,Body,ColorWhite)

	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACE],ColorFilterBack)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGEFABRIK],ColorFilterFront)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorFilterSelected)
	ButtonImageSetImage(Button,BUTTONIMAGESELECTED,Game.ButtonImages.ImageListSelected[BUTTONIMAGEBUTTONSELECTED],ColorFilterSelected)

	ButtonListAddButton(GalaxyView.ButtonFilterList,Button)

	ButtonCreate(Button,BUTTONFILTERKASERNE,Body,ColorWhite)

	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACE],ColorFilterBack)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGEKASERNE],ColorFilterFront)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorFilterSelected)
	ButtonImageSetImage(Button,BUTTONIMAGESELECTED,Game.ButtonImages.ImageListSelected[BUTTONIMAGEBUTTONSELECTED],ColorFilterSelected)

	ButtonListAddButton(GalaxyView.ButtonFilterList,Button)

	ButtonCreate(Button,BUTTONFILTERGREENCRYSTAL,Body,ColorWhite)

	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACE],ColorFilterBack)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGECRYSTAL],ColorFilterFront)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorFilterSelected)
	ButtonImageSetImage(Button,BUTTONIMAGESELECTED,Game.ButtonImages.ImageListSelected[BUTTONIMAGEBUTTONSELECTED],ColorFilterSelected)

	ButtonListAddButton(GalaxyView.ButtonFilterList,Button)

	ButtonCreate(Button,BUTTONFILTERBLUECRYSTAL,Body,ColorWhite)

	ButtonImageSetImage(Button,BUTTONIMAGEBACK,Game.ButtonImages.ImageListBack[BUTTONIMAGEFACE],ColorFilterBack)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGECRYSTAL],ColorFilterFront)
	ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEBUTTONOVERLAY],ColorFilterSelected)
	ButtonImageSetImage(Button,BUTTONIMAGESELECTED,Game.ButtonImages.ImageListSelected[BUTTONIMAGEBUTTONSELECTED],ColorFilterSelected)

	ButtonListAddButton(GalaxyView.ButtonFilterList,Button)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewCreate(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)

	GalaxyView.Body[0].AbsoluteCoordinate.X = cx
	GalaxyView.Body[0].AbsoluteCoordinate.Y = cy

	GalaxyView.Body[0].Size.Width = vx
	GalaxyView.Body[0].Size.Height = vy

	GalaxyView.Body[0].Scale.X = 1
	GalaxyView.Body[0].Scale.Y = 1

	GalaxyViewBackgroundImagesCreate(GalaxyView,Game)
	GalaxyViewFilterButtonsCreate(GalaxyView,Game)

	GalaxyViewPlayerRessourceTextCreate(GalaxyView)
	GalaxyViewPlayerFleetTextCreate(GalaxyView)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewReset(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)

	local i as integer
	local k as integer
	local Button as TButton
	local Body as TBody[0]
	local ViewFactor as TCoordinate
	local ValueSector as integer[0]
	local ValuePlanet as integer[1]

	//ViewFactor.X = 1.0 * GalaxyView.Body[0].Size.Width / Galaxy.Size.Galaxy.Width
	//ViewFactor.Y = 1.0 * GalaxyView.Body[0].Size.Height / Galaxy.Size.Galaxy.Height

	//ViewFactor.X = 1.0 * Galaxy.Size.Galaxy.Width / GalaxyView.Body[0].Size.Width
	//ViewFactor.Y = 1.0 * Galaxy.Size.Galaxy.Height / GalaxyView.Body[0].Size.Height

	ViewFactor.X = 1.0
	ViewFactor.Y = 1.0

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	Body[0].Size = Galaxy.Size.Sector

	ButtonListCreate(GalaxyView.SectorButtonList,GalaxyView.Body,ColorWhite)

	for i = 0 to Galaxy.SectorList.Length

		Body[0].RelativeCoordinate.X = Galaxy.SectorList[i].Coordinate.X * ViewFactor.X - GalaxyView.Body[0].Size.Width * 0.5
		Body[0].RelativeCoordinate.Y = Galaxy.SectorList[i].Coordinate.Y * ViewFactor.Y - GalaxyView.Body[0].Size.Height * 0.5

		CalcAbsoluteCoordinate(Body[0].AbsoluteCoordinate,Body[0].RelativeCoordinate,GalaxyView.Body[0].AbsoluteCoordinate)

		ButtonCreate(Button,GalaxyView.SectorButtonList.Button.Length+1,Body,ColorWhite)

		ValueSector[0] = i

		ButtonSetSpecialValue(Button,ValueSector)

		ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGESECTOROVERLAY],ColorWhite)
		ButtonImageSetImage(Button,BUTTONIMAGESELECTED,Game.ButtonImages.ImageListSelected[BUTTONIMAGESECTORSELECTED],ColorSelected)

		ButtonListAddButton(GalaxyView.SectorButtonList,Button)

	next i

	Body[0].Size = Galaxy.Size.Planet

	ButtonListCreate(GalaxyView.PlanetButtonList,GalaxyView.Body,ColorWhite)

	for i = 0 to Galaxy.SectorList.Length
		for k = 0 to Galaxy.SectorList[i].PlanetList.Length

			Body[0].RelativeCoordinate.X = Galaxy.SectorList[i].PlanetList[k].GalaxyCoordinate.X * ViewFactor.X - GalaxyView.Body[0].Size.Width * 0.5
			Body[0].RelativeCoordinate.Y = Galaxy.SectorList[i].PlanetList[k].GalaxyCoordinate.Y * ViewFactor.Y - GalaxyView.Body[0].Size.Height * 0.5
	
			CalcAbsoluteCoordinate(Body[0].AbsoluteCoordinate,Body[0].RelativeCoordinate,GalaxyView.Body[0].AbsoluteCoordinate)
	
			ButtonCreate(Button,GalaxyView.PlanetButtonList.Button.Length+1,Body,ColorWhite)

			ValuePlanet[0] = i
			ValuePlanet[1] = k

			ButtonSetSpecialValue(Button,ValuePlanet)

			ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontPlanet[BUTTONIMAGEPLANETICONTINY],ColorWhite)
			ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontPlanet[BUTTONIMAGEPLANETICONSMALL],ColorWhite)
			ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontPlanet[BUTTONIMAGEPLANETICONMEDIUM],ColorWhite)
			ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontPlanet[BUTTONIMAGEPLANETICONBIG],ColorWhite)

			ButtonImageSetImage(Button,BUTTONIMAGEOVERLAY,Game.ButtonImages.ImageListOverlay[BUTTONIMAGEPLANETOVERLAY],ColorWhite)
			ButtonImageSetImage(Button,BUTTONIMAGESELECTED,Game.ButtonImages.ImageListSelected[BUTTONIMAGEPLANETICONSELECTED],ColorSelected)
	
			ButtonListAddButton(GalaxyView.PlanetButtonList,Button)

		next k
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewInit(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)

	GalaxyView.Color = Galaxy.PlayerColorList[FACTIONPLAYER]
	ImageSetColor(GalaxyView.BackgroundImage,ColorWhite)
	ImageRefresh(GalaxyView.BackgroundImage)
	ImageSetColor(GalaxyView.FrameImage,GalaxyView.Color)
	ImageRefresh(GalaxyView.FrameImage)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewConfig(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)

	GalaxyViewConfigPlanetFilter(GalaxyView,Galaxy,Game)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewConfigSector(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Index as integer,Game ref as TGame)

	/*

	local i as integer

	for i = 0 to Game.SectorView.Length
		if Game.SectorView[i].Enabled = 1 and Game.SectorView[i].SectorListIndex = Index
			ButtonSelectedSet(GalaxyView.SectorButton)
		else
			ButtonUnSelectedSet(GalaxyView.SectorButton)
		endif
	next i

	*/

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewConfigPlanetFilter(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)
	
	local PlanetImageSizeIndex as integer
	local i as integer
	local k as integer
	local Index as integer

	for Index = 0 to GalaxyView.PlanetButtonList.Button.Length
	
		i = GalaxyView.PlanetButtonList.Button[Index].SpecialValue[0]
		k = GalaxyView.PlanetButtonList.Button[Index].SpecialValue[1]

		PlanetImageSizeIndex = 0

		Select GalaxyView.FilterIndex
			case BUTTONFILTERNONE	
				if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality < FILTERLIMITLOW
					PlanetImageSizeIndex = 0
				endif
				if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality >= FILTERLIMITLOW and Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality < FILTERLIMITMID
					PlanetImageSizeIndex = 1
				endif
				if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality >= FILTERLIMITMID and Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality < FILTERLIMITHIGH
					PlanetImageSizeIndex = 2
				endif
				if Galaxy.FactionPlayerSectorList[i].PlanetList[k].Loyality >= FILTERLIMITHIGH
					PlanetImageSizeIndex = 3
				endif
			endcase
			case BUTTONFILTERFABRIK
				if Galaxy.SectorList[i].PlanetList[k].FabrikCount < FILTERLIMITBUILDINGLOW
					PlanetImageSizeIndex = 0
				endif
				if Galaxy.SectorList[i].PlanetList[k].FabrikCount >= FILTERLIMITBUILDINGLOW and Galaxy.SectorList[i].PlanetList[k].FabrikCount < FILTERLIMITBUILDINGMID
					PlanetImageSizeIndex = 1
				endif
				if Galaxy.SectorList[i].PlanetList[k].FabrikCount >= FILTERLIMITBUILDINGMID and Galaxy.SectorList[i].PlanetList[k].FabrikCount < FILTERLIMITBUILDINGHIGH
					PlanetImageSizeIndex = 2
				endif
				if Galaxy.SectorList[i].PlanetList[k].FabrikCount >= FILTERLIMITBUILDINGHIGH
					PlanetImageSizeIndex = 3
				endif
			endcase
			case BUTTONFILTERKASERNE
				if Galaxy.SectorList[i].PlanetList[k].KaserneCount < FILTERLIMITBUILDINGLOW
					PlanetImageSizeIndex = 0
				endif
				if Galaxy.SectorList[i].PlanetList[k].KaserneCount >= FILTERLIMITBUILDINGLOW and Galaxy.SectorList[i].PlanetList[k].KaserneCount < FILTERLIMITBUILDINGMID
					PlanetImageSizeIndex = 1
				endif
				if Galaxy.SectorList[i].PlanetList[k].KaserneCount >= FILTERLIMITBUILDINGMID and Galaxy.SectorList[i].PlanetList[k].KaserneCount < FILTERLIMITBUILDINGHIGH
					PlanetImageSizeIndex = 2
				endif
				if Galaxy.SectorList[i].PlanetList[k].KaserneCount >= FILTERLIMITBUILDINGHIGH
					PlanetImageSizeIndex = 3
				endif
			endcase
			case BUTTONFILTERGREENCRYSTAL
				if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel = 0
					PlanetImageSizeIndex = 0
				endif
				if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel > 0 and Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel < FILTERLIMITLOW
					PlanetImageSizeIndex = 1
				endif
				if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel >= FILTERLIMITLOW and Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel < FILTERLIMITMID
					PlanetImageSizeIndex = 2
				endif
				if Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalBlueLevel + Galaxy.SectorList[i].PlanetList[k].Crystal.CrystalGreenLevel >= FILTERLIMITMID
					PlanetImageSizeIndex = 3
				endif
			endcase
		endselect
		
		ButtonImageSet(GalaxyView.PlanetButtonList.Button[Index],BUTTONIMAGEFRONT,PlanetImageSizeIndex)
		ButtonRefreshColor(GalaxyView.PlanetButtonList.Button[Index],BUTTONIMAGEFRONT,Galaxy.PlayerColorList[Galaxy.SectorList[i].PlanetList[k].Faction.FactionType])

	next Index


/*

	PlanetViewEnabled = 0
	for i = 0 to Game.PlanetView.Length
		if Game.PlanetView[i].Enabled = 1 and Game.PlanetView[i].SectorListIndex = i and Game.PlanetView[i].PlanetListIndex = k
			PlanetViewEnabled = 1
		endif
	next i

	if PlanetViewEnabled = 1
		ButtonSelectedSet(GalaxyView.PlanetButton)
	else
		ButtonUnSelectedSet(GalaxyView.PlanetButton)
		ButtonImageSet(GalaxyView.PlanetButton,BUTTONIMAGEFRONT,PlanetImageSizeIndex)
		ButtonRefreshColor(GalaxyView.PlanetButton,BUTTONIMAGEFRONT,Galaxy.PlayerColorList[Galaxy.SectorList[i].PlanetList[k].Faction.FactionType])
	endif
			
*/

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewSectorInput(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Mouse ref as TMouse,Game ref as TGame)
	
	if ButtonListInput(GalaxyView.SectorButtonList,Mouse) > 0
		
		//GalaxyView.SectorButtonList.ButtonType

		MouseRefresh(Mouse)
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewPlanetInput(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Mouse ref as TMouse,Game ref as TGame)
	
	local i as integer
	local k as integer
	local Index as integer
	local PlanetViewIndex as integer

	if ButtonListInput(GalaxyView.PlanetButtonList,Mouse) > 0

		Index = GalaxyView.PlanetButtonList.ButtonType

		i = GalaxyView.PlanetButtonList.Button[Index].SpecialValue[0]
		k = GalaxyView.PlanetButtonList.Button[Index].SpecialValue[1]
		
		//GameViewPlanetOpen(Galaxy,i,k,Game)

		MouseRefresh(Mouse)

	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewInput(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Mouse ref as TMouse,Game ref as TGame)

	GameTimeCheckSkipDay(Galaxy.GameTime,Mouse)

	if ButtonListInput(GalaxyView.ButtonFilterList,Mouse) > 0
		GalaxyView.FilterIndex = GalaxyView.ButtonFilterList.ButtonType
		GalaxyViewConfig(GalaxyView,Galaxy,Game)
		MouseRefresh(Mouse)
	endif

	GalaxyViewPlanetInput(GalaxyView,Galaxy,Mouse,Game)
	GalaxyViewSectorInput(GalaxyView,Galaxy,Mouse,Game)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GalaxyViewDraw(GalaxyView ref as TGalaxyView,Galaxy ref as TGalaxy,Game ref as TGame)
	
	local TextListStrings as string[-1]

	ImageDraw(GalaxyView.BackgroundImage)
	ImageDraw(GalaxyView.FrameImage)
	
	TextListStrings.Insert(str(Galaxy.Player.Erze))
	TextListStrings.Insert(str(Galaxy.Player.BasisMaterial))
	TextListStrings.Insert(str(Galaxy.Player.Minerale))
	TextListStrings.Insert(str(Galaxy.Player.HightechMaterial))

	TextListSetTextString(GalaxyView.PlayerRessourceTextList,TextListStrings)
	TextListDraw(GalaxyView.PlayerRessourceTextList)

	TextListStrings.Length = -1

	TextListStrings.Insert(str(Galaxy.Player.PirateFleet.Kampfwert))
	TextListStrings.Insert(str(Galaxy.Player.MerchantFleet.Handelswert))
	TextListStrings.Insert(str(Galaxy.Player.SupportFleet.Versorgungswert))
	TextListStrings.Insert(str(Galaxy.Player.TransportFleet.Kapazitaet))

	TextListSetTextString(GalaxyView.PlayerFleetTextList,TextListStrings)
	TextListDraw(GalaxyView.PlayerFleetTextList)

	ButtonListDraw(GalaxyView.SectorButtonList,Game.Mouse)
	ButtonListDraw(GalaxyView.PlanetButtonList,Game.Mouse)

	ButtonListDraw(GalaxyView.ButtonFilterList,Game.Mouse)

	GameTimeDraw(Galaxy.GameTime,Game.Mouse)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

