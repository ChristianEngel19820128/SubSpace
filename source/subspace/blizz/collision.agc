
//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

type TPoint
	
	X as float
	Y as float
	
endtype

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

type TLine
	
	A as TPoint
	B as TPoint
	Length as float
	
endtype

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

type TBox
	
	A as TPoint
	B as TPoint
	C as TPoint
	D as TPoint
	M as TPoint
	X1 as float
	X2 as float
	Y1 as float
	Y2 as float
	Width as float
	Height as float
	
endtype

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

type TCircle
	
	M as TPoint
	R as float
	D as float
	
endtype

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

type TEllipse
	
	M as TPoint
	W as float
	H as float
	
endtype

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function ObjectsCollide(CoordinateOne ref as TCoordinate,SizeOne ref as TSize,CoordinateTwo ref as TCoordinate,SizeTwo ref as TSize)
	
	local BoxOne as TBox
	local BoxTwo as TBox
	
	local Value as integer
	
	SetBox(BoxOne,CoordinateOne.X,CoordinateOne.Y,SizeOne.Width,SizeOne.Height)
	SetBox(BoxTwo,CoordinateTwo.X,CoordinateTwo.Y,SizeTwo.Width,SizeTwo.Height)
	
	Value = BoxInBox(BoxOne,BoxTwo)
	
endfunction Value

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function ObjectCollide(CoordinateOne ref as TCoordinate,SizeOne ref as TSize,CoordinateTwo ref as TCoordinate)

	local Box as TBox

	local Value as integer
	
	SetBox(Box,CoordinateOne.X,CoordinateOne.Y,SizeOne.Width,SizeOne.Height)

	Value = XYInBox(CoordinateTwo.X,CoordinateTwo.Y,Box)
	
endfunction Value

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function SetBox(Box ref as TBox,X as float,Y as float,Width as float,Height as float)
	
	Box.A.X = X
	Box.A.Y = Y
	
	Box.B.X = X + Width
	Box.B.Y = Y
	
	Box.C.X = X + Width
	Box.C.Y = Y + Height
	
	Box.D.X = X
	Box.D.Y = Y + Height
	
	Box.X1 = X
	Box.X2 = X + Width
	Box.Y1 = Y
	Box.Y2 = Y + Height
	
	Box.M.X = X + Width / 2
	Box.M.Y = Y + Height / 2

	Box.Width = Width
	Box.Height = Height
	
endfunction

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function XYInBox(x as float,y as float,Box as TBox)

	local Value as integer

	Value = 0
	
	if X >= Box.X1 and X <= Box.X2
		if Y >= Box.Y1 and Y <= Box.Y2
			Value = 1
		endif
	endif

endfunction Value

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function PointInBox(Point as TPoint,Box as TBox)

	local Value as integer

	Value = 0
	
	if Point.X >= Box.X1 and Point.X <= Box.X2
		if Point.Y >= Box.Y1 and Point.Y <= Box.Y2
			Value = 1
		endif
	endif

endfunction Value

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function BoxInBox(Box1 as TBox,Box2 as TBox)

	local Value as integer
	
	Value = 0
	
	if Box1.X1 < Box2.X2
		if Box1.X2 > Box2.X1
			if Box1.Y1 < Box2.Y2
				if Box1.Y2 > Box2.Y1
					Value = 1
				endif
			endif
		endif
	endif
	
endfunction Value

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function CircleInCircle(Circle1 as TCircle,Circle2 as TCircle)
	
	local Value as integer
	
	local dx as float
	local dy as float
	local Distance as float
	
	Value = 0
	
	dx = Circle1.M.X - Circle2.M.X
	dy = Circle1.M.Y - Circle2.M.Y
	
	Distance = sqrt(dx * dx + dy * dy)
	
	if Distance < Circle1.R + Circle2.R
		Value = 1
	endif
	
endfunction Value

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------



