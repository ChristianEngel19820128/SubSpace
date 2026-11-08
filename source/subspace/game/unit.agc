
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TUnit
	
	Enabled as integer
	
	UnitType as integer
	
	Faction as integer
	
	// position data
	
	Speed as float
	MoveTimer as integer
	Coordinate as TCoordinate
	
	// life data
	
	MaxHitPoints as integer
	HitPoints as integer
	DefensePoints as integer
	MaxRepairPoints as integer
	RepairPoints as integer
	
	// build data
	
	BuildTimer as integer
	BuildPoints as integer
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function UnitCreate(Unit ref as TUnit)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function UnitMoveTo(Unit ref as TUnit,Coordinate as TCoordinate)


endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function UnitDie(Unit ref as TUnit)

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------
