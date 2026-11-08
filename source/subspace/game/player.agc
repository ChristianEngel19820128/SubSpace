
//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TPlayer
	
	Luck as integer
	Moral as integer
	Loyality as integer
	Guidance as integer
	
	// rohstoffe
	
	Erze as integer
	BasisMaterial as integer
	Minerale as integer
	HightechMaterial as integer
	
	// spezialflotten
	
	MerchantFleet as TMerchantFleet  // support for planets and buildings
	SupportFleet as TSupportFleet    // support for units
	TransportFleet as TransportFleet // transport of units
	PirateFleet as TPirateFleet      // create special events
	
	
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function PlayerCreate(Player ref as TPlayer)
	
	Player.Luck = random(0,100)
	
	Player.Moral = random(Player.Luck*0.2,Player.Luck*0.8)
	Player.Loyality = random(Player.Luck*0.2,Player.Luck*0.8)
	Player.Guidance = random(Player.Luck*0.2,Player.Luck*0.8)
	
	Player.Erze = 0
	Player.BasisMaterial = 0
	Player.Minerale = 0
	Player.HightechMaterial = 0
	
	Player.MerchantFleet.Handelswert = random(Player.Luck*0.2,Player.Luck*0.8)
	Player.SupportFleet.Versorgungswert = random(Player.Luck*0.2,Player.Luck*0.8)
	Player.TransportFleet.Kapazitaet = random(Player.Luck*0.2,Player.Luck*0.8)
	Player.PirateFleet.Kampfwert = random(Player.Luck*0.2,Player.Luck*0.8)
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------

