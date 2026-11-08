
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TImageList

	Enabled as integer

	Body as TBody
	Color as TColor
	
	Image as TImage[-1]
	Index as integer

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListDelete(ImageList ref as TImageList)

	local i as integer

	for i = 0 to ImageList.Image.Length
		ImageDelete(ImageList.Image[i])
	next i

	ImageList.Image.Length = -1
	ImageList.Index = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListCreate(ImageList ref as TImageList,Body ref as TBody,Color ref as TColor)

	ImageList.Enabled = 0
	ImageList.Body = Body
	ImageList.Color = Color

	ImageListDelete(ImageList)
	ImageList.Index = -1

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ImageListAddImage(ImageList ref as TImageList)

	

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



