
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

type TSlideBar
	
	Enabled as integer
	
	Coordinate as TCoordinate

	Image as TImage
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSlideGrip
	
	Enabled as integer
	
	Coordinate as TCoordinate

	Image as TImage
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSlideText
	
	Enabled as integer
	
	Coordinate as TCoordinate
	
	Text as TText
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TSlider
	
	Enabled as integer
	
	SliderType as integer
	
	Coordinate as TCoordinate

	BackGround as TImage
	Bar as TSlideBar
	Grip as TSlideGrip[2]
	
	ValueText as TSlideText[2]
	
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

	local i as integer
	local c as TCoordinate

	Slider.Coordinate = Coordinate

	ImageSetCoordinate(Slider.BackGround,Slider.Coordinate)
	ImageRefresh(Slider.BackGround)

	for i = 0 to 2
		c.x = Slider.Coordinate.X + Slider.Grip[i].Coordinate.X
		c.y = Slider.Coordinate.Y + Slider.Grip[i].Coordinate.Y
		ImageSetCoordinate(Slider.Grip[i].Image,c)
		ImageRefresh(Slider.Grip[i].Image)
	next i

	for i = 0 to 2
		c.x = Slider.Coordinate.X + Slider.ValueText[i].Coordinate.X
		c.y = Slider.Coordinate.Y + Slider.ValueText[i].Coordinate.Y
		TextSetCoordinate(Slider.ValueText[i].Text,c)
		TextRefresh(Slider.ValueText[i].Text)
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function DrawSlider(Slider ref as TSlider)
	
	local i as integer

	if Slider.Background.Enabled = 1
		ImageDraw(Slider.BackGround)
	endif

	if Slider.Bar.Enabled = 1
		ImageDraw(Slider.Bar.Image)
	endif
	
	for i = 0 to 2
		if Slider.Grip[i].Enabled = 1
			ImageDraw(Slider.Grip[i].Image)
		endif
	next i

	for i = 0 to 2	
		if Slider.ValueText[i].Enabled = 1
			TextDraw(Slider.ValueText[i].Text)
		endif
	next i

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------



