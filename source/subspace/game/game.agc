
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TGame
	
	Mouse as TMouse
	
	Option as TOption
	
	PlanetImages as TPlanetImages
	
	Galaxy as TGalaxy
	
	PlanetView as TPlanetView
	SectorView as TSectorView[1]
	GalaxyView as TGalaxyView
	
	ModeSectorViewAutoSort as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameLoadData(Game ref as TGame)
	
	local i as integer
	
	PlanetImagesLoadImages(Game.PlanetImages)
	
	MouseLoadImages(Game.Mouse)
	OptionLoadImages(Game.Option)
	PlanetViewLoadImages(Game.PlanetView,Game)
	for i = 0 to Game.SectorView.Length
		SectorViewLoadImages(Game.SectorView[i])
	next i
	GalaxyViewLoadImages(Game.GalaxyView,Game.Galaxy,Game.Galaxy.GameTime)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameCreate(Game ref as TGame)
	
	local i as integer
	
	GalaxyCreate(Game.Galaxy,Game.Option,Game.SectorView)
	GalaxyViewCreate(Game.GalaxyView,Game.Galaxy,Game)
	for i = 0 to 1
		SectorViewCreate(Game.SectorView[i],Game)
	next i
	PlanetViewCreate(Game.PlanetView,Game)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function GameInput(Game ref as TGame)
	
	local i as integer
	
	PlanetViewInput(Game.PlanetView,Game.Mouse)
	for i = 0 to 1
		SectorViewInput(Game.SectorView[i],i,Game.Galaxy.SectorList[Game.SectorView[i].SectorListIndex].PlanetList,Game.Mouse,Game.PlanetView,Game)
	next i
	GalaxyViewInput(Game.GalaxyView,Game.Galaxy,Game.Mouse,Game)
	
	if Game.Mouse.Hit = 1 and Game.Mouse.Time+100 < GetMilliseconds()
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
	
	GalaxyViewDraw(Game.GalaxyView,Game.Galaxy,Game.Mouse,Game)
	for i = 0 to 1
		SectorViewDraw(Game.SectorView[i],Game.Galaxy.SectorList[Game.SectorView[i].SectorListIndex],Game.Galaxy.Size,Game)
	next i
	PlanetViewDraw(Game.PlanetView,Game.Galaxy.SectorList[Game.PlanetView.SectorListIndex].PlanetList[Game.PlanetView.PlanetListIndex],Game.Galaxy.Size,Game)
	MouseDraw(Game.Mouse)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



