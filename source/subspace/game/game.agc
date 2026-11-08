
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGame
	
	Mouse as TMouse
	
	Option as TOption
	
	ButtonImages as TButtonImages
	FrameImages as TFrameImages
	PlanetImages as TPlanetImages
	
	Galaxy as TGalaxy
	Information as TInformation
	Logic as TLogic
	
	PlanetView as TPlanetView[-1]
	SectorView as TSectorView[-1]
	GalaxyView as TGalaxyView
	
	ModeSectorViewAutoSort as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameLoadData(Game ref as TGame)
	
	ButtonImagesLoad(Game.ButtonImages)
	FrameImagesLoad(Game.FrameImages)
	PlanetImagesLoad(Game.PlanetImages)
	
	MouseLoadImages(Game.Mouse)
	OptionLoadImages(Game.Option)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameCreate(Game ref as TGame)
	
	GalaxyViewCreate(Game.GalaxyView,Game.Galaxy,Game)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameInit(Game ref as TGame)
	
	GameCreate(Game)

	GalaxyCreate(Game.Galaxy,Game.Option,Game.SectorView,Game)
	
	GalaxyViewInit(Game.GalaxyView,Game.Galaxy,Game)
	GalaxyViewReset(Game.GalaxyView,Game.Galaxy,Game)
	GalaxyViewConfig(Game.GalaxyView,Game.Galaxy,Game)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameInput(Game ref as TGame)
	
	local i as integer
	

	for i = 0 to Game.PlanetView.Length
		PlanetViewInput(Game.PlanetView[i],Game.Mouse)
	next i

	for i = 0 to Game.SectorView.Length
		SectorViewInput(Game.SectorView[i],i,Game.Galaxy.SectorList[Game.SectorView[i].SectorListIndex].PlanetList,Game.Mouse,Game.PlanetView,Game)
	next i

	GalaxyViewInput(Game.GalaxyView,Game.Galaxy,Game.Mouse,Game)
	
	if Game.Mouse.Hit = 1 and Game.Mouse.Time+240 < GetMilliseconds()
		Game.Mouse.Time = GetMilliseconds()
		MouseRefresh(Game.Mouse)
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameDo(Game ref as TGame)
	
	GalaxyDo(Game.Galaxy,Game)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameDraw(Game ref as TGame)
	
	local i as integer
	
	GalaxyViewDraw(Game.GalaxyView,Game.Galaxy,Game)

	for i = 0 to Game.SectorView.Length
		SectorViewDraw(Game.SectorView[i],Game.Galaxy.SectorList[Game.SectorView[i].SectorListIndex],Game.Galaxy.Size,Game)
	next i

	for i = 0 to Game.PlanetView.Length
		PlanetViewDraw(Game.PlanetView[i],Game.Galaxy.SectorList[Game.PlanetView[i].SectorListIndex].PlanetList[Game.PlanetView[i].PlanetListIndex],Game)
	next i

	MouseDraw(Game.Mouse)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



