
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TPlanetView
	
	Enabled as integer
	Position as integer
	
	Body as TBody
	
	Frame as TFrame
	
	PlanetFrameImage as TImage
	
	ButtonShip as TButton
	ButtonFabrik as TButton
	
	SectorListIndex as integer
	PlanetListIndex as integer
	
	PlanetViewIndex as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewCreate(PlanetView ref as TPlanetView,Game ref as TGame)
	
	local ImageNameList as string[-1]
	local Body as TBody

	PlanetView.Body.Coordinate.X = vx * 0.75
	PlanetView.Body.Coordinate.Y = cy
	PlanetView.Body.Size.Width = 750
	PlanetView.Body.Size.Height = 818

	Body.Coordinate = PlanetView.Body.Coordinate

	ImageNameList.Insert("sector0.png")
	ImageNameList.Insert("sector1.png")
	FrameCreate(PlanetView.Frame,ImageNameList,0,Body,Game.Galaxy)
	FrameAddButton(PlanetView.Frame,BUTTONTYPECLOSET)
	FrameAddButton(PlanetView.Frame,BUTTONTYPESLIP)
	FrameAddButton(PlanetView.Frame,BUTTONTYPESWITCH)

	Body.Coordinate.X = PlanetView.Body.Coordinate.X
	Body.Coordinate.Y = PlanetView.Body.Coordinate.Y

	ImageCreate(PlanetView.PlanetFrameImage,"gui_galaxy_planetview_blackframe.png",Body,ColorSelected)
	
	Body.Coordinate.X = PlanetView.Body.Coordinate.X + 55
	Body.Coordinate.Y = PlanetView.Body.Coordinate.Y + 55

	ButtonImageCreate(PlanetView.ButtonShip,BUTTONIMAGEFRONT,"gui_galaxy_button_filtership.png",Body,Game.Galaxy.PlayerColorList[Game.Galaxy.SectorList[PlanetView.SectorListIndex].PlanetList[PlanetView.PlanetListIndex].Faction.FactionType])

	Body.Coordinate.X = PlanetView.Body.Coordinate.X + 55
	Body.Coordinate.Y = PlanetView.Body.Coordinate.Y - 55

	ButtonImageCreate(PlanetView.ButtonFabrik,BUTTONIMAGEFRONT,"gui_galaxy_button_filterfabrik.png",Body,Game.Galaxy.PlayerColorList[Game.Galaxy.SectorList[PlanetView.SectorListIndex].PlanetList[PlanetView.PlanetListIndex].Faction.FactionType])

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewEnable(PlanetView ref as TPlanetView,SectorListIndex as integer,PlanetListIndex as integer,PlanetViewIndex as integer,Game ref as TGame)
	
	PlanetView.Enabled = 1
	PlanetView.Position = 1
	PlanetView.SectorListIndex = SectorListIndex
	PlanetView.PlanetListIndex = PlanetListIndex
	PlanetView.PlanetViewIndex = PlanetViewIndex
	
	PlanetViewCreate(PlanetView,Game)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewInput(PlanetView ref as TPlanetView,Mouse ref as TMouse)
	
	if PlanetView.Enabled = 1
		if ButtonHit(Mouse,PlanetView.ButtonClose) = 1
			MouseRefresh(Mouse)
			PlanetView.Enabled = 0
		endif
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetViewDraw(PlanetView ref as TPlanetView,Planet ref as TPlanet,GalaxySize ref as TGalaxySize,Game ref as TGame)
	
	if PlanetView.Enabled = 1
		
		FrameDraw(PlanetView.Frame)
		ImageDraw(PlanetView.PlanetFrameImage)
		PlanetImagesDraw(Game.PlanetImages,Planet.PlanetIndex,PlanetView.Body.Coordinate.X,PlanetView.Body.Coordinate.Y,1)
		ButtonDraw(PlanetView.ButtonShip)
		ButtonDraw(PlanetView.ButtonFabrik)

	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


