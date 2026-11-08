
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant SECTORMIN 20
#constant SECTORMAX	60

#constant PLANETMIN 1
#constant PLANETMAX 20

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TOptionGalaxyData

	MinSectorCount as integer
	MaxSectorCount as integer

	MinPlanetCount as integer
	MaxPlanetCount as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TOption
	
	Enabled as integer
	
	Start as integer
	StartMenu as integer
	
	FrameImage as TImage

	BackgroundImageID as integer
	BackgroundSpriteID as integer
	
	StartTextID as integer
	StartMenuTextID as integer
	
	PlayerColorTextID as integer
	
	FactionRebellImageID as integer
	FactionRebellSpriteID as integer
	
	FactionEmpireImageID as integer
	FactionEmpireSpriteID as integer
	
	FactionSelectImageID as integer
	FactionSelectSpriteID as integer
	
	GalaxyDataSectorCountTextID as integer
	GalaxyDataPlanetCountTextID as integer
	
	SelectMinTextID as integer
	SelectMaxTextID as integer
		
	SelectBarImageID as integer
	SelectBarSpriteID as integer
	
	SelectCursorImageID as integer
	SelectCursorSpriteID as integer
	
	SelectCursorLeftImageID as integer
	SelectCursorLeftSpriteID as integer
	
	SelectCursorRightImageID as integer
	SelectCursorRightSpriteID as integer
	
	PlayerColor as integer
	GalaxyData as TOptionGalaxyData

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function OptionSetData(Option ref as TOption)
	
	Option.PlayerColor = 0
	OptionSetGalaxyData(Option.GalaxyData)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function OptionSetGalaxyData(OptionGalaxyData ref as TOptionGalaxyData)
	
	OptionGalaxyData.MinSectorCount = 20
	OptionGalaxyData.MaxSectorCount = 30
	
	OptionGalaxyData.MinPlanetCount = 3
	OptionGalaxyData.MaxPlanetCount = 10

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function OptionLoadImages(Option ref as TOption)	
	
	local Body as TBody[0]

	Body[0].AbsoluteCoordinate.X = cx
	Body[0].AbsoluteCoordinate.Y = cy

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	ImageCreate(Option.FrameImage,"frame/frame.png",Body,ColorWhite)
	ImageRefresh(Option.FrameImage)

	Option.BackgroundImageID = LoadImage("frame/frame.png")
	Option.BackgroundSpriteID = CreateSprite(Option.BackgroundImageID)
	
	SetSpriteOffset(Option.BackgroundSpriteID,GetSpriteWidth(Option.BackgroundSpriteID)*0.5,GetSpriteHeight(Option.BackgroundSpriteID)*0.5)
	SetSpritePositionByOffset(Option.BackgroundSpriteID,cx,cy)
	
	
	Option.StartTextID = CreateText("START")
	SetTextAlignment(Option.StartTextID,1)
	SetTextSize(Option.StartTextID,40)
	SetTextBold(Option.StartTextID,0)
	SetTextPosition(Option.StartTextID,vx-GetTextTotalWidth(Option.StartTextID)-60,vy-120-120)
	
	Option.StartMenuTextID = CreateText("STARTMENU")
	SetTextAlignment(Option.StartMenuTextID,1)
	SetTextSize(Option.StartMenuTextID,40)
	SetTextBold(Option.StartMenuTextID,0)
	SetTextPosition(Option.StartMenuTextID,vx-GetTextTotalWidth(Option.StartMenuTextID)-60,vy-120-60)
	
	Option.PlayerColorTextID = CreateText("Select Faction")
	SetTextAlignment(Option.PlayerColorTextID,1)
	SetTextSize(Option.PlayerColorTextID,32)
	SetTextBold(Option.PlayerColorTextID,0)
	SetTextPosition(Option.PlayerColorTextID,cx,cy-100)	
	
	Option.FactionRebellImageID = LoadImage("faction/faction_rebell.png")
	Option.FactionRebellSpriteID = CreateSprite(Option.FactionRebellImageID)
	
	SetSpriteOffset(Option.FactionRebellSpriteID,GetSpriteWidth(Option.FactionRebellSpriteID)*0.5,GetSpriteHeight(Option.FactionRebellSpriteID)*0.5)
	SetSpritePositionByOffset(Option.FactionRebellSpriteID,cx-20-GetSpriteWidth(Option.FactionRebellSpriteID)*0.5,cy)
	
	Option.FactionEmpireImageID = LoadImage("faction/faction_empire.png")
	Option.FactionEmpireSpriteID = CreateSprite(Option.FactionEmpireImageID)
	
	SetSpriteOffset(Option.FactionEmpireSpriteID,GetSpriteWidth(Option.FactionEmpireSpriteID)*0.5,GetSpriteHeight(Option.FactionEmpireSpriteID)*0.5)
	SetSpritePositionByOffset(Option.FactionEmpireSpriteID,cx+20+GetSpriteWidth(Option.FactionEmpireSpriteID)*0.5,cy)
	
	Option.FactionSelectImageID = LoadImage("faction/faction_select.png")
	Option.FactionSelectSpriteID = CreateSprite(Option.FactionSelectImageID)
	
	SetSpriteOffset(Option.FactionSelectSpriteID,GetSpriteWidth(Option.FactionSelectSpriteID)*0.5,GetSpriteHeight(Option.FactionSelectSpriteID)*0.5)
	
	Option.GalaxyDataSectorCountTextID = CreateText("Select Sector Count")
	SetTextAlignment(Option.GalaxyDataSectorCountTextID,1)
	SetTextSize(Option.GalaxyDataSectorCountTextID,32)
	SetTextBold(Option.GalaxyDataSectorCountTextID,0)
	SetTextPosition(Option.GalaxyDataSectorCountTextID,150,cy-450)
	
	Option.SelectMinTextID = CreateText("0")
	SetTextAlignment(Option.SelectMinTextID,1)
	SetTextSize(Option.SelectMinTextID,32)
	SetTextBold(Option.SelectMinTextID,0)
	
	Option.SelectMaxTextID = CreateText("0")
	SetTextAlignment(Option.SelectMaxTextID,1)
	SetTextSize(Option.SelectMaxTextID,32)
	SetTextBold(Option.SelectMaxTextID,0)
	
	Option.SelectBarImageID = LoadImage("slider/select_bar.png")
	Option.SelectBarSpriteID = CreateSprite(Option.SelectBarImageID)
	
	SetSpriteOffset(Option.SelectBarSpriteID,GetSpriteWidth(Option.SelectBarSpriteID)*0.5,GetSpriteHeight(Option.SelectBarSpriteID)*0.5)
	
	Option.SelectCursorImageID = LoadImage("slider/select_cursor.png")
	Option.SelectCursorSpriteID = CreateSprite(Option.SelectCursorImageID)
	
	SetSpriteOffset(Option.SelectCursorSpriteID,GetSpriteWidth(Option.SelectCursorSpriteID)*0.5,GetSpriteHeight(Option.SelectCursorSpriteID)*0.5)
	
	Option.SelectCursorLeftImageID = LoadImage("slider/select_cursor_left.png")
	Option.SelectCursorLeftSpriteID = CreateSprite(Option.SelectCursorLeftImageID)
	
	SetSpriteOffset(Option.SelectCursorLeftSpriteID,GetSpriteWidth(Option.SelectCursorLeftSpriteID),GetSpriteHeight(Option.SelectCursorLeftSpriteID)*0.5)
	
	Option.SelectCursorRightImageID = LoadImage("slider/select_cursor_right.png")
	Option.SelectCursorRightSpriteID = CreateSprite(Option.SelectCursorRightImageID)
	
	SetSpriteOffset(Option.SelectCursorRightSpriteID,0,GetSpriteHeight(Option.SelectCursorRightSpriteID)*0.5)
	
	Option.GalaxyDataPlanetCountTextID = CreateText("Select Planet Count")
	SetTextAlignment(Option.GalaxyDataPlanetCountTextID,1)
	SetTextSize(Option.GalaxyDataPlanetCountTextID,32)
	SetTextBold(Option.GalaxyDataPlanetCountTextID,0)
	SetTextPosition(Option.GalaxyDataPlanetCountTextID,150,cy-400)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function OptionDraw(Option ref as TOption)
	
	local PositionX as float
	
	ImageDraw(Option.FrameImage)

	//DrawSprite(Option.BackgroundSpriteID)
	DrawText(Option.StartTextID)
	DrawText(Option.StartMenuTextID)
	
	if Option.StartMenu = 1
		
		DrawText(Option.PlayerColorTextID)
		DrawSprite(Option.FactionRebellSpriteID)
		DrawSprite(Option.FactionEmpireSpriteID)
		
		if Option.PlayerColor = 0
			SetSpritePositionByOffset(Option.FactionSelectSpriteID,GetSpriteXByOffset(Option.FactionRebellSpriteID),GetSpriteYByOffset(Option.FactionRebellSpriteID))
		else
			SetSpritePositionByOffset(Option.FactionSelectSpriteID,GetSpriteXByOffset(Option.FactionEmpireSpriteID),GetSpriteYByOffset(Option.FactionEmpireSpriteID))
		endif
		DrawSprite(Option.FactionSelectSpriteID)
		
		DrawText(Option.GalaxyDataSectorCountTextID)
		
		SetSpritePositionByOffset(Option.SelectBarSpriteID,GetTextX(Option.GalaxyDataSectorCountTextID)+300,GetTextY(Option.GalaxyDataSectorCountTextID)+GetTextTotalHeight(Option.GalaxyDataSectorCountTextID)*0.5)
		DrawSprite(Option.SelectBarSpriteID)
		
		SetTextString(Option.SelectMinTextID,str(Option.GalaxyData.MinSectorCount))
		SetTextPosition(Option.SelectMinTextID,GetSpriteX(Option.SelectBarSpriteID)-30,GetTextY(Option.GalaxyDataSectorCountTextID))
		DrawText(Option.SelectMinTextID)
		
		SetTextString(Option.SelectMaxTextID,str(Option.GalaxyData.MaxSectorCount))
		SetTextPosition(Option.SelectMaxTextID,GetSpriteX(Option.SelectBarSpriteID)+GetSpriteWidth(Option.SelectBarSpriteID)+30,GetTextY(Option.GalaxyDataSectorCountTextID))
		DrawText(Option.SelectMaxTextID)
		
		PositionX = GetSpriteX(Option.SelectBarSpriteID) + Option.GalaxyData.MinSectorCount*GetSpriteWidth(Option.SelectBarSpriteID)/SECTORMAX
		
		SetSpritePositionByOffset(Option.SelectCursorLeftSpriteID,PositionX,GetTextY(Option.GalaxyDataSectorCountTextID)+GetTextTotalHeight(Option.GalaxyDataSectorCountTextID)*0.5)
		DrawSprite(Option.SelectCursorLeftSpriteID)
		
		PositionX = GetSpriteX(Option.SelectBarSpriteID) + Option.GalaxyData.MaxSectorCount*GetSpriteWidth(Option.SelectBarSpriteID)/SECTORMAX
		
		SetSpritePositionByOffset(Option.SelectCursorRightSpriteID,PositionX,GetTextY(Option.GalaxyDataSectorCountTextID)+GetTextTotalHeight(Option.GalaxyDataSectorCountTextID)*0.5)
		DrawSprite(Option.SelectCursorRightSpriteID)
		
		DrawText(Option.GalaxyDataPlanetCountTextID)
		
		SetSpritePositionByOffset(Option.SelectBarSpriteID,GetTextX(Option.GalaxyDataPlanetCountTextID)+300,GetTextY(Option.GalaxyDataPlanetCountTextID)+GetTextTotalHeight(Option.GalaxyDataPlanetCountTextID)*0.5)
		DrawSprite(Option.SelectBarSpriteID)
		
		SetTextString(Option.SelectMinTextID,str(Option.GalaxyData.MinPlanetCount))
		SetTextPosition(Option.SelectMinTextID,GetSpriteX(Option.SelectBarSpriteID)-30,GetTextY(Option.GalaxyDataPlanetCountTextID))
		DrawText(Option.SelectMinTextID)
		
		SetTextString(Option.SelectMaxTextID,str(Option.GalaxyData.MaxPlanetCount))
		SetTextPosition(Option.SelectMaxTextID,GetSpriteX(Option.SelectBarSpriteID)+GetSpriteWidth(Option.SelectBarSpriteID)+30,GetTextY(Option.GalaxyDataPlanetCountTextID))
		DrawText(Option.SelectMaxTextID)
		
		PositionX = GetSpriteX(Option.SelectBarSpriteID) + Option.GalaxyData.MinPlanetCount*GetSpriteWidth(Option.SelectBarSpriteID)/PLANETMAX

		SetSpritePositionByOffset(Option.SelectCursorLeftSpriteID,PositionX,GetTextY(Option.GalaxyDataPlanetCountTextID)+GetTextTotalHeight(Option.GalaxyDataPlanetCountTextID)*0.5)
		DrawSprite(Option.SelectCursorLeftSpriteID)
		
		PositionX = GetSpriteX(Option.SelectBarSpriteID) + Option.GalaxyData.MaxPlanetCount*GetSpriteWidth(Option.SelectBarSpriteID)/PLANETMAX
		
		SetSpritePositionByOffset(Option.SelectCursorRightSpriteID,PositionX,GetTextY(Option.GalaxyDataPlanetCountTextID)+GetTextTotalHeight(Option.GalaxyDataPlanetCountTextID)*0.5)
		DrawSprite(Option.SelectCursorRightSpriteID)
		
	endif
		
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function OptionStartGame(Option ref as TOption)
	
	local Value as integer
	
	Value = Option.Start
	Option.Start = 0
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function OptionInput(Option ref as TOption,Mouse ref as TMouse)
	
	local Coordinate as TCoordinate
	local Size as TSize
	
	Coordinate.X = GetTextX(Option.StartTextID)
	Coordinate.Y = GetTextY(Option.StartTextID)+GetTextTotalHeight(Option.StartTextID)*0.5
	
	Size.Width = GetTextTotalWidth(Option.StartTextID)
	Size.Height = GetTextTotalHeight(Option.StartTextID)
	
	if MouseOver(Mouse,Coordinate,Size)
		SetTextSize(Option.StartTextID,44)
		SetTextBold(Option.StartTextID,1)
		if MouseClick(Mouse) = 1
			MouseRefresh(Mouse)
			Option.Start = 1
		endif
	else
		SetTextSize(Option.StartTextID,40)
		SetTextBold(Option.StartTextID,0)
	endif
	
	Coordinate.X = GetTextX(Option.StartMenuTextID)
	Coordinate.Y = GetTextY(Option.StartMenuTextID)+GetTextTotalHeight(Option.StartMenuTextID)*0.5
	
	Size.Width = GetTextTotalWidth(Option.StartMenuTextID)
	Size.Height = GetTextTotalHeight(Option.StartMenuTextID)
	
	if MouseOver(Mouse,Coordinate,Size)
		SetTextSize(Option.StartMenuTextID,44)
		SetTextBold(Option.StartMenuTextID,1)
		if MouseClick(Mouse) = 1
			MouseRefresh(Mouse)
			Option.StartMenu = 1
		endif
	else
		SetTextSize(Option.StartMenuTextID,40)
		SetTextBold(Option.StartMenuTextID,0)
	endif
	
	Coordinate.X = GetSpriteXByOffset(Option.FactionRebellSpriteID)
	Coordinate.Y = GetSpriteYByOffset(Option.FactionRebellSpriteID)
	
	Size.Width = GetSpriteWidth(Option.FactionRebellSpriteID)
	Size.Height = GetSpriteHeight(Option.FactionRebellSpriteID)
	
	if MouseOver(Mouse,Coordinate,Size)
		if MouseClick(Mouse) = 1
			MouseRefresh(Mouse)
			Option.PlayerColor = 0
		endif
	endif
	
	Coordinate.X = GetSpriteXByOffset(Option.FactionEmpireSpriteID)
	Coordinate.Y = GetSpriteYByOffset(Option.FactionEmpireSpriteID)
	
	Size.Width = GetSpriteWidth(Option.FactionEmpireSpriteID)
	Size.Height = GetSpriteHeight(Option.FactionEmpireSpriteID)
	
	if MouseOver(Mouse,Coordinate,Size)
		if MouseClick(Mouse) = 1
			MouseRefresh(Mouse)
			Option.PlayerColor = 1
		endif
	endif
	
	if Mouse.Hit = 1 and Mouse.Time+100 < GetMilliseconds()
		Mouse.Time = GetMilliseconds()
		MouseRefresh(Mouse)
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------










