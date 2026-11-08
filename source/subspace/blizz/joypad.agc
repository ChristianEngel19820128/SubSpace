
//----------------------------------------------------------------------
// xbox buttons const
//----------------------------------------------------------------------

#CONSTANT JoystickButtonA 1
#CONSTANT JoystickButtonB 2
#CONSTANT JoystickButtonX 3
#CONSTANT JoystickButtonY 4
#CONSTANT JoystickButtonLR 5
#CONSTANT JoystickButtonRR 6
#CONSTANT JoystickButtonBack 7
#CONSTANT JoystickButtonStart 8
#CONSTANT JoystickButtonPadLeft 9
#CONSTANT JoystickButtonPadRight 10
#CONSTANT JoystickButton 11

#CONSTANT JoystickButtonCrossLeft 13
#CONSTANT JoystickButtonCrossUp 14
#CONSTANT JoystickButtonCrossRight 15
#CONSTANT JoystickButtonCrossDown 16

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

type TJoypad
	Enabled as integer
	JoystickIndex as integer
endtype

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------

function SetJoystickIndex(Joypad ref as TJoypad)
	
	local i as integer
	
	Joypad.JoystickIndex = 1
	
	for i = 8 to 1 step -1
		if GetRawJoystickExists(i) then Joypad.JoystickIndex = i
	next i
	
endfunction

//----------------------------------------------------------------------
// 
//----------------------------------------------------------------------