
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TFrameImages
	
	ImageBack as TImage
	ImageFrame as TImage
	ImageFrameNull as TImage
	ImageFrameOne as TImage
	ImageFrameBack as TImage

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function FrameImagesLoad(FrameImages ref as TFrameImages)

	local Body as TBody[0]

	Body[0].Scale.X = 1
	Body[0].Scale.Y = 1

	ImageCreateProto(FrameImages.ImageBack,"frame/back.png",Body,ColorWhite)
	ImageCreateProto(FrameImages.ImageFrame,"frame/frame.png",Body,ColorWhite)
	ImageCreateProto(FrameImages.ImageFrameNull,"frame/frame_0.png",Body,ColorWhite)
	ImageCreateProto(FrameImages.ImageFrameOne,"frame/frame_1.png",Body,ColorWhite)
	ImageCreateProto(FrameImages.ImageFrameBack,"frame/frame_back.png",Body,ColorWhite)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

