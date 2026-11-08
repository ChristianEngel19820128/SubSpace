
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant BUTTONPLANETFABRIK 0
#constant BUTTONPLANETSHIP 1

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TPlanetView
	
	Enabled as integer
	Position as integer
	
	Body as TBody[1]
	
	Frame as TFrame
	ViewState as TViewState

	ImagePlanet as TImage
	ImagePlanetFrame as TImage
	
	ButtonListPlanet as TButtonList
	
	SectorListIndex as integer
	PlanetListIndex as integer
	
	PlanetViewIndex as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewCreate(PlanetView ref as TPlanetView,SectorListIndex as integer,PlanetListIndex as integer,PlanetViewIndex as integer,Game ref as TGame)
	
	local i as integer
	local Body as TBody[-1]
	local Color as TColor
	local Button as TButton

	PlanetView.SectorListIndex = SectorListIndex
	PlanetView.PlanetListIndex = PlanetListIndex
	PlanetView.PlanetViewIndex = PlanetViewIndex

	PlanetView.Body[0].RelativeCoordinate.X = vx * 0.25
	PlanetView.Body[0].RelativeCoordinate.Y = 0
	PlanetView.Body[0].AbsoluteCoordinate.X = cx + PlanetView.Body[0].RelativeCoordinate.X
	PlanetView.Body[0].AbsoluteCoordinate.Y = cy + PlanetView.Body[0].RelativeCoordinate.Y 

	PlanetView.Body[0].Size.Width = 750
	PlanetView.Body[0].Size.Height = 818

	PlanetView.Body[0].Scale.X = 1
	PlanetView.Body[0].Scale.Y = 1

	PlanetView.Body[1].RelativeCoordinate.X = - (vx * 0.25)
	PlanetView.Body[1].RelativeCoordinate.Y = 0
	PlanetView.Body[1].AbsoluteCoordinate.X = cx + PlanetView.Body[1].RelativeCoordinate.X
	PlanetView.Body[1].AbsoluteCoordinate.Y = cy + PlanetView.Body[1].RelativeCoordinate.Y 

	PlanetView.Body[1].Size.Width = 750
	PlanetView.Body[1].Size.Height = 818

	PlanetView.Body[1].Scale.X = 1
	PlanetView.Body[1].Scale.Y = 1

	// frame

	FrameViewCreate(PlanetView.Frame,PlanetView.Frame.Body,Game)

	// planet

	ImageSet(PlanetView.ImagePlanetFrame,Game.PlanetImages.ImageBack,PlanetView.Body,ColorSelected)
	ImageSet(PlanetView.ImagePlanet,Game.PlanetImages.ImageList[PlanetView.PlanetViewIndex].ScaledImage,PlanetView.Body,ColorWhite)
	
	// button list

	BodyAdd(Body,PlanetView.Body)

	for i = 0 to Body.Length

		Body[i].Rotation.RotationType = ROTATERIGHT
		Body[i].Rotation.Radius = 60
		Body[i].Rotation.Angle = 45

	next i

	Color = Game.Galaxy.PlayerColorList[Game.Galaxy.SectorList[PlanetView.SectorListIndex].PlanetList[PlanetView.PlanetListIndex].Faction.FactionType]

	ButtonListCreate(PlanetView.ButtonListPlanet,Body,ColorWhite)

	ButtonCreate(Button,BUTTONPLANETFABRIK,Body,ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGEFABRIK],ColorWhite)
	ButtonListAddButton(PlanetView.ButtonListPlanet,Button)

	ButtonCreate(Button,BUTTONPLANETSHIP,Body,ColorWhite)
	ButtonImageSetImage(Button,BUTTONIMAGEFRONT,Game.ButtonImages.ImageListFrontButton[BUTTONIMAGESHIP],ColorWhite)
	ButtonListAddButton(PlanetView.ButtonListPlanet,Button)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewEnable(PlanetView ref as TPlanetView)
	
	PlanetView.Enabled = 1
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewDisable(PlanetView ref as TPlanetView)
	
	PlanetView.Enabled = 0
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewInput(PlanetView ref as TPlanetView,Mouse ref as TMouse)
	
	if PlanetView.Enabled = 1
		// Index = FrameInput()
		// Index = ButtonListInput()
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewDraw(PlanetView ref as TPlanetView,Planet ref as TPlanet,Game ref as TGame)
	
	if PlanetView.Enabled = 1
		
		FrameDraw(PlanetView.Frame,Game.Mouse)
		ImageDraw(PlanetView.ImagePlanetFrame)
		ImageDraw(PlanetView.ImagePlanet)
		ButtonListDraw(PlanetView.ButtonListPlanet,Game.Mouse)

	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


