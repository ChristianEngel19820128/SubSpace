
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant KONTINENTAL 0
#constant ARKTISCH 1
#constant TROPISCH 2
#constant WUESTE 3
#constant OZEAN 4
#constant GASRIESE 5

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TPlanetImage
	
	PlanetType as integer
	
	Image as TImage
	ScaledImage as TImage

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TPlanetImages
	
	ImageList as TPlanetImage[-1]
	ImageBack as TImage

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetImagesLoad(PlanetImages ref as TPlanetImages)
	
	local i as integer
	local FileName as string
	local Body as TBody[0]
	local PlanetImage as TPlanetImage
	
	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	ImageCreate(PlanetImages.ImageBack,"planet/frame.png",Body,ColorWhite)

	i = 0
	repeat
		
		inc i
		
		FileName = "planet_"
		if i < 100 then FileName = FileName + "0"
		if i < 10 then FileName = FileName + "0"
		FileName = FileName + str(i)
		FileName = FileName + ".png"
		
		if GetFileExists("planet/"+FileName) = 1
			
			Body[0].Scale.X = 1
			Body[0].Scale.Y = 1
			ImageCreate(PlanetImage.Image,"planet/"+FileName,Body,ColorWhite)
			Body[0].Scale.X = 2
			Body[0].Scale.Y = 2
			ImageCreateProto(PlanetImage.ScaledImage,"planet/"+FileName,Body,ColorWhite)

			PlanetImages.ImageList.Insert(PlanetImage)
			
		endif

	until GetFileExists("planet/"+FileName) = 0

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetImagesSetCoordinate(PlanetImages ref as TPlanetImages,Index as integer,Coordinate ref as TCoordinate)

	ImageSetAbsoluteCoordinate(PlanetImages.ImageList[Index].Image,Coordinate)
	ImageSetAbsoluteCoordinate(PlanetImages.ImageList[Index].ScaledImage,Coordinate)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlanetImagesDraw(PlanetImages ref as TPlanetImages,Index as integer,Scaled as integer)
	
	local SpriteID as integer
	
	if Scaled = 0
		ImageDraw(PlanetImages.ImageList[Index].Image)
	else
		ImageDraw(PlanetImages.ImageList[Index].ScaledImage)
	endif
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

