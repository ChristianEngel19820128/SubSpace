
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TImage

	Enabled as integer

	Body as TBody
	Color as TColor
	
	ImageID as integer
	SpriteID as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageDelete(Image ref as TImage)

	Image.Enabled = 0

	if GetImageExists(Image.ImageID) = 1
		DeleteImage(Image.ImageID)
		Image.ImageID = 0
	endif

	if GetSpriteExists(Image.SpriteID) = 1
		DeleteSprite(Image.SpriteID)
		Image.SpriteID = 0
	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCreate(Image ref as TImage,Filename as string,Body ref as TBody,Color ref as TColor)
	
	ImageDelete(Image)

	Image.Enabled = 0

	Image.Body = Body
	Image.Color = Color
	
	ImageLoad(Image,FileName)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSet(Image ref as TImage,NewImage ref as TImage,Body ref as TBody,Color ref as TColor)

	ImageDelete(Image)

	Image.Enabled = 0

	Image.Body = Body
	Image.Color = Color

	Image = NewImage

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageLoad(Image ref as TImage,FileName as string)
	
	local Value as integer
	Value = 0
	
	if FileName = "0"
		Value = 1
	else
		if GetFileExists(FileName) = 1
			Image.ImageID = LoadImage(FileName)
			if Image.ImageID > 0
				if GetImageExists(Image.ImageID) = 1
					Image.SpriteID = CreateSprite(Image.ImageID)
					if Image.SpriteID > 0
						if GetSpriteExists(Image.SpriteID) = 1
						
							Value = 1
							Image.Enabled = 1
							
							SetSpriteVisible(Image.SpriteID,0)
							
							SetSpriteScaleByOffset(Image.SpriteID,Image.Body.Scale.X,Image.Body.Scale.Y)
							Image.Body.Size.Width = GetSpriteWidth(Image.SpriteID)
							Image.Body.Size.Height = GetSpriteHeight(Image.SpriteID)

						endif
					endif
				endif
			endif
		endif
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageRefresh(Image ref as TImage)
	
	local Value as integer
	Value = 0
	
	if Image.SpriteID > 0
		if GetSpriteExists(Image.SpriteID) = 1
		
			SetSpriteOffset(Image.SpriteID,GetSpriteWidth(Image.SpriteID)*0.5,GetSpriteHeight(Image.SpriteID)*0.5)
			
			if GetSpriteWidth(Image.SpriteID) <> Image.Body.Size.Width * Image.Body.Scale.X
				if GetSpriteHeight(Image.SpriteID) <> Image.Body.Size.Height * Image.Body.Scale.Y
					SetSpriteScaleByOffset(Image.SpriteID,Image.Body.Scale.X,Image.Body.Scale.Y)
					Image.Body.Size.Width = GetSpriteWidth(Image.SpriteID)
					Image.Body.Size.Height = GetSpriteHeight(Image.SpriteID)
				endif
			endif
			
			SetSpritePositionByOffset(Image.SpriteID,Image.Body.Coordinate.X,Image.Body.Coordinate.Y)
			SetSpriteColor(Image.SpriteID,Image.Color.Red,Image.Color.Green,Image.Color.Blue,Image.Color.Alpha)
			
			Value = 1
			Image.Enabled = 1

		endif
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetEnableValue(Image ref as TImage,Enabled as integer)
	
	Image.Enabled = Enabled
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetEnabled(Image ref as TImage)
	
	Image.Enabled = 1
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetDisabled(Image ref as TImage)
	
	Image.Enabled = 0
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetCoordinate(Image ref as TImage,Coordinate ref as TCoordinate)
	
	Image.Body.Coordinate = Coordinate
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetXY(Image ref as TImage,X as integer,Y as integer)
	
	Image.Body.Coordinate.X = X
	Image.Body.Coordinate.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetX(Image ref as TImage,X as integer)
	
	Image.Body.Coordinate.X = X
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SetImageY(Image ref as TImage,Y as integer)
	
	Image.Body.Coordinate.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScale(Image ref as TImage,Scale ref as TScale)
	
	Image.Body.Scale = Scale
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScaleXY(Image ref as TImage,X as integer,Y as integer)
	
	Image.Body.Scale.X = X
	Image.Body.Scale.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScaleX(Image ref as TImage,X as integer)
	
	Image.Body.Scale.X = X
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScaleY(Image ref as TImage,Y as integer)
	
	Image.Body.Scale.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetColor(Image ref as TImage,Color ref as TColor)
	
	Image.Color = Color
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetColorValues(Image ref as TImage,Red as integer,Green as integer,Blue as integer,Alpha as integer)
	
	Image.Color.Red = Red
	Image.Color.Green = Green
	Image.Color.Blue = Blue
	Image.Color.Alpha = Alpha
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCollideTwo(ImageOne ref as TImage,ImageTwo ref as TImage)
	
	local Value as integer
	
	Value = ImageCollide(ImageOne,ImageTwo.Body.Coordinate,ImageTwo.Body.Size)
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCollide(Image ref as TImage,Coordinate ref as TCoordinate,Size ref as TSize)

	local Value as integer
	
	Value = ObjectsCollide(Image.Body.Coordinate,Image.Body.Size,Coordinate,Size)
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageDraw(Image ref as TImage)

	local Value as integer
	Value = 0
	
	if Image.Enabled = 1
		if Image.SpriteID > 0
			if GetSpriteExists(Image.SpriteID) = 1
				SetSpritePositionByOffset(Image.SpriteID,Image.Body.Coordinate.X,Image.Body.Coordinate.Y)
				DrawSprite(Image.SpriteID)
				Value = 1
			endif
		endif
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------






