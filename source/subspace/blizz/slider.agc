
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant SINGLESLIDER 0
#constant DOUBLESLIDER 1
#constant TRIPPELSLIDER 2

#constant CENTERVALUEID 0
#constant LEFTVALUEID 1
#constant RIGHTVALUEID 2

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSlider
	
	Enabled as integer
	
	SliderType as integer
	
	Body as TBody

	BackGround as TImage
	Bar as TImage
	GripLeft as TImage
	GripCenter as TImage
	GripRight as TImage

	ValueTextLeft as TText
	ValueTextCenter as TText
	ValueTextRight as TText

	Value as float[2]
	MinValue as float
	MaxValue as float
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SliderCreate(Slider ref as TSlider,SliderType as integer)
	
	Slider.Enabled = 0
	
	Slider.SliderType = SliderType
	

	
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SliderConfigValue(Slider ref as TSlider,MinValue as float,MaxValue as float,Value ref as float[])

	select Value.Length
		case 0
			Slider.Value[CENTERVALUEID] = Value[0]
		endcase
		case 1
			Slider.Value[LEFTVALUEID] = Value[0]
			Slider.Value[RIGHTVALUEID] = Value[1]
		endcase
		case 2
			Slider.Value[CENTERVALUEID] = Value[0]
			Slider.Value[LEFTVALUEID] = Value[1]
			Slider.Value[RIGHTVALUEID] = Value[2]
		endcase
	endselect

	Slider.MinValue = MinValue
	Slider.MaxValue = MaxValue

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SetSingleSliderImages(Slider ref as TSlider,BackFileName as string,BarFileName as string,GripFileName as string)
	
	
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SetDoubleSliderImages(Slider ref as TSlider,BackFileName as string,BarFileName as string,GripFileName as string)
	
	
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function SetTrippleSliderImages(Slider ref as TSlider,BackFileName as string,BarFileName as string,GripFileName as string)
	
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function RefreshSliderValue(Slider ref as TSlider,CenterValue as float,LeftValue as float,RightValue as float)

	Slider.Value[CENTERVALUEID] = CenterValue
	Slider.Value[LEFTVALUEID] = LeftValue
	Slider.Value[RIGHTVALUEID] = RightValue

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function RefreshSliderCoordinate(Slider ref as TSlider,Coordinate as TCoordinate)



endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function DrawSlider(Slider ref as TSlider)
	
	local i as integer

	ImageDraw(Slider.BackGround)

	ImageDraw(Slider.Bar)
	ImageDraw(Slider.GripLeft)
	ImageDraw(Slider.GripCenter)
	ImageDraw(Slider.GripRight)

	TextDraw(Slider.ValueTextLeft)
	TextDraw(Slider.ValueTextCenter)
	TextDraw(Slider.ValueTextRight)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



