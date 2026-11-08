
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant GAMEVIEWTYPESECTOR 0
#constant GAMEVIEWTYPEPLANET 1

//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant GAMEVIEWINDEXTYPESECTOR 0
#constant GAMEVIEWINDEXTYPEPLANET 1

//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant VIEWMODENORMAL 0
#constant VIEWMODEMINIMIZED 1
#constant VIEWMODEMAXIMIZED 2

#constant VIEWPOSITIONCENTER 0
#constant VIEWPOSITIONLEFT 1
#constant VIEWPOSITIONRIGHT 2

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TViewState

	Enabled as integer
	ViewType as integer
	ViewMode as integer
	PositionType as integer

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TViewRegistry

	ViewType as integer
	IndexList as integer[-1]
	ViewIndex as integer

endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ViewRegistryFindView(ViewRegistryList ref as TViewRegistry[],ViewType as integer,IndexList as integer[])

	local Value as integer
	local i as integer
	local k as integer

	Value = -1

	for i = 0 to ViewRegistryList.Length
		if ViewRegistryList[i].ViewType = ViewType
			Value = ViewRegistryList[i].ViewIndex
			for k = 0 to IndexList.Length
				if IndexList[k] >= 0
					if ViewRegistryList[i].IndexList[k] <> IndexList[k]
						Value = -1
					endif
				endif
			next k
		endif
	next i

endfunction Value

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ViewRegistryOpenView(ViewRegistryList ref as TViewRegistry[])

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ViewRegistryActivateView(ViewRegistryList ref as TViewRegistry[])

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function ViewRegistryAddView(ViewRegistryList ref as TViewRegistry[])

endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------






