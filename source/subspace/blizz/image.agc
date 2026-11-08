
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TImage

	Enabled as integer
	ProtoImage as integer

	Body as TBody[-1]
	BodyIndex as integer

	Color as TColor
	
	ImageID as integer
	SpriteID as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageDelete(Image ref as TImage)

	Image.Enabled = 0

	if Image.ProtoImage = 0
	
		if GetImageExists(Image.ImageID) = 1
			//DeleteImage(Image.ImageID)
			Image.ImageID = 0
		endif
	
		if GetSpriteExists(Image.SpriteID) = 1
			//DeleteSprite(Image.SpriteID)
			Image.SpriteID = 0
		endif

	endif

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCreateProto(Image ref as TImage,Filename as string,Body ref as TBody[],Color ref as TColor)

	Image.ProtoImage = 1
	ImageCreate(Image,Filename,Body,Color)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCreate(Image ref as TImage,Filename as string,Body ref as TBody[],Color ref as TColor)

	Image.Enabled = 0

	Image.Body.Length = -1
	ImageDelete(Image)

	BodyAdd(Image.Body,Body)
	Image.BodyIndex = 0

	Image.Color = Color
	
	ImageLoad(Image,FileName)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSet(Image ref as TImage,NewImage ref as TImage,Body ref as TBody[],Color ref as TColor)

	local i as integer

	Image.Enabled = 1

	BodyAdd(Image.Body,Body)
	Image.BodyIndex = 0

	for i = 0 to Image.Body.Length
		if Image.Body.Length = NewImage.Body.Length
			Image.Body[i].Size = NewImage.Body[i].Size
		else
			Image.Body[i].Size = NewImage.Body[0].Size
		endif
	next i

	Image.Color = Color

	Image.ImageID = NewImage.ImageID
	Image.SpriteID = NewImage.SpriteID

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetBody(Image ref as TImage,Body ref as TBody[])

	Image.Body.Length = -1
	BodyAdd(Image.Body,Body)
	Image.BodyIndex = 0

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageAddBody(Image ref as TImage,Body ref as TBody)

	Image.Body.Insert(Body)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetBodyIndex(Image ref as TImage,BodyIndex as integer)

	Image.BodyIndex = BodyIndex

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
							
							Image.Body[Image.BodyIndex].Size.Width = GetSpriteWidth(Image.SpriteID)
							Image.Body[Image.BodyIndex].Size.Height = GetSpriteHeight(Image.SpriteID)

							SetSpriteVisible(Image.SpriteID,1)
							ImageRefresh(Image)

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

function ImageRefreshNew(Image ref as TImage,NewImage ref as TImage)

	Image.Color = NewImage.Color
	Image.Body.Length = -1
	BodyAdd(Image.Body,NewImage.Body)

	ImageRefresh(Image)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageRefresh(Image ref as TImage)
	
	local Value as integer

	Value = 0

	if Image.SpriteID > 0
		if GetSpriteExists(Image.SpriteID) = 1
		
			SetSpriteOffset(Image.SpriteID,GetSpriteWidth(Image.SpriteID)*0.5,GetSpriteHeight(Image.SpriteID)*0.5)
			
			if GetSpriteWidth(Image.SpriteID) <> Image.Body[Image.BodyIndex].Size.Width
				if GetSpriteHeight(Image.SpriteID) <> Image.Body[Image.BodyIndex].Size.Height
					SetSpriteScaleByOffset(Image.SpriteID,Image.Body[Image.BodyIndex].Scale.X,Image.Body[Image.BodyIndex].Scale.Y)
					Image.Body[Image.BodyIndex].Size.Width = GetSpriteWidth(Image.SpriteID)
					Image.Body[Image.BodyIndex].Size.Height = GetSpriteHeight(Image.SpriteID)
				endif
			endif
			
			SetSpritePositionByOffset(Image.SpriteID,Image.Body[Image.BodyIndex].AbsoluteCoordinate.X,Image.Body[Image.BodyIndex].AbsoluteCoordinate.Y)
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

function ImageSetRelativeCoordinate(Image ref as TImage,Coordinate ref as TCoordinate)
	
	Image.Body[Image.BodyIndex].RelativeCoordinate = Coordinate
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetAbsoluteCoordinate(Image ref as TImage,Coordinate ref as TCoordinate)
	
	Image.Body[Image.BodyIndex].AbsoluteCoordinate = Coordinate
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCalcAbsoluteCoordinate(Image ref as TImage,Coordinate ref as TCoordinate)
	
	CalcAbsoluteCoordinate(Image.Body[Image.BodyIndex].AbsoluteCoordinate,Image.Body[Image.BodyIndex].RelativeCoordinate,Coordinate)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetXY(Image ref as TImage,X as integer,Y as integer)
	
	Image.Body[Image.BodyIndex].AbsoluteCoordinate.X = X
	Image.Body[Image.BodyIndex].AbsoluteCoordinate.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetX(Image ref as TImage,X as integer)
	
	Image.Body[Image.BodyIndex].AbsoluteCoordinate.X = X
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SetImageY(Image ref as TImage,Y as integer)
	
	Image.Body[Image.BodyIndex].AbsoluteCoordinate.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScale(Image ref as TImage,Scale ref as TScale)
	
	Image.Body[Image.BodyIndex].Scale = Scale
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScaleXY(Image ref as TImage,X as integer,Y as integer)
	
	Image.Body[Image.BodyIndex].Scale.X = X
	Image.Body[Image.BodyIndex].Scale.Y = Y
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScaleX(Image ref as TImage,X as integer)
	
	Image.Body[Image.BodyIndex].Scale.X = X
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageSetScaleY(Image ref as TImage,Y as integer)
	
	Image.Body[Image.BodyIndex].Scale.Y = Y
	
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
	
	Value =  ObjectsCollide(ImageOne.Body[ImageOne.BodyIndex].AbsoluteCoordinate,ImageOne.Body[ImageOne.BodyIndex].Size,ImageTwo.Body[ImageTwo.BodyIndex].AbsoluteCoordinate,ImageTwo.Body[ImageTwo.BodyIndex].Size)
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageCollide(Image ref as TImage,Coordinate ref as TCoordinate,Size ref as TSize)

	local Value as integer
	
	Value = ObjectsCollide(Image.Body[Image.BodyIndex].AbsoluteCoordinate,Image.Body[Image.BodyIndex].Size,Coordinate,Size)
	
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
				//SetSpriteColor(Image.SpriteID,Image.Color.Red,Image.Color.Green,Image.Color.Blue,Image.Color.Alpha)
				//SetSpritePositionByOffset(Image.SpriteID,Image.Body[Image.BodyIndex].AbsoluteCoordinate.X,Image.Body[Image.BodyIndex].AbsoluteCoordinate.Y)
				ImageRefresh(Image)
				DrawSprite(Image.SpriteID)
				Value = 1
			endif
		endif
	endif
	
endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------






