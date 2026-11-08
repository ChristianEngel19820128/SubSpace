
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
	
	Body as TBody[-1]
	
	Frame as TFrame

	ButtonPlanet as TButton[-1]
	ImageFilter as TImage[-1]
	ButtonFabrik as TButton[-1]
	ButtonShip as TButton[-1]

	IconSlotImage as TImage

	FilterIndex as integer
	ButtonFilterList as TButtonList
	
	SectorListIndex as integer
	PlanetListIndex as integer
	
	SectorViewIndex as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewRefresh(SectorView ref as TSectorView,Game ref as TGame)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewCreate(SectorView ref as TSectorView,Game ref as TGame)
	
	// ButtonPlanet erzeugen
	// ButtonType = PlanetIndex

	SectorView.Body[0].RelativeCoordinate.X = vx * 0.25
	SectorView.Body[0].RelativeCoordinate.Y = 0
	SectorView.Body[0].AbsoluteCoordinate.X = cx + SectorView.Body[0].RelativeCoordinate.X
	SectorView.Body[0].AbsoluteCoordinate.Y = cy + SectorView.Body[0].RelativeCoordinate.Y 

	SectorView.Body[0].Size.Width = 750
	SectorView.Body[0].Size.Height = 818

	SectorView.Body[0].Scale.X = 1
	SectorView.Body[0].Scale.Y = 1

	SectorView.Body[1].RelativeCoordinate.X = - (vx * 0.25)
	SectorView.Body[1].RelativeCoordinate.Y = 0
	SectorView.Body[1].AbsoluteCoordinate.X = cx + SectorView.Body[1].RelativeCoordinate.X
	SectorView.Body[1].AbsoluteCoordinate.Y = cy + SectorView.Body[1].RelativeCoordinate.Y 

	SectorView.Body[1].Size.Width = 750
	SectorView.Body[1].Size.Height = 818

	SectorView.Body[1].Scale.X = 1
	SectorView.Body[1].Scale.Y = 1

	// frame

	FrameViewCreate(SectorView.Frame,SectorView.Frame.Body,Game)

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

	SectorView.Enabled = 1
	SectorView.Position = Position
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewInput(SectorView ref as TSectorView,SectorViewIndex as integer,PlanetList ref as TPlanet[],Mouse ref as TMouse,PlanetViewList ref as TPlanetView[],Game ref as TGame)
	
	local i as integer
	local CounterIndex as integer
	local PlanetView as TPlanetView

	if SectorView.Enabled = 1
		
		if SectorViewIndex = 0
			CounterIndex = 1
		else
			CounterIndex = 0
		endif
	
		for i = 0 to SectorView.ButtonPlanet.Length
			if ButtonHit(Mouse,SectorView.ButtonPlanet[i]) = 1
				MouseRefresh(Mouse)
				if SectorView.Position = 1
					SectorView.Position = 0
					SectorViewRefresh(Game.SectorView[SectorViewIndex],Game)
					SectorViewPlanetPosSet(Game.SectorView[SectorViewIndex],Game)
					Game.SectorView[CounterIndex].Enabled = 0
				endif
				SectorView.PlanetListIndex = SectorView.ButtonPlanet[i].ButtonType
				PlanetViewCreate(PlanetView,SectorView.SectorListIndex,SectorView.PlanetListIndex,i,Game)
				PlanetViewEnable(PlanetView)
				PlanetViewList.Insert(PlanetView)
			endif
		next i

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

function SectorViewPlanetDraw(SectorView ref as TSectorView,Sector ref as TSector,GalaxySize ref as TGalaxySize,Game ref as TGame)
		
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SectorViewDraw(SectorView ref as TSectorView,Sector ref as TSector,GalaxySize ref as TGalaxySize,Game ref as TGame)
	
	local i as integer
	
	if SectorView.Enabled = 1
		
		FrameDraw(SectorView.Frame,Game.Mouse)
		
		SectorViewPlanetDraw(SectorView,Sector,GalaxySize,Game)
		
		for i = 0 to SectorView.ButtonShip.Length
			ButtonDraw(SectorView.ButtonShip[i],Game.Mouse)
		next i
		
		for i = 0 to SectorView.ButtonFabrik.Length
			ButtonDraw(SectorView.ButtonFabrik[i],Game.Mouse)
		next i

		ButtonListDraw(SectorView.ButtonFilterList,Game.Mouse)

	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


