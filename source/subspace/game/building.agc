
//--------------------------------------------------------------
//
//--------------------------------------------------------------

#constant BUILDINGFABRIK 101           // planetare gebäude bauen
#constant BUILDINGDOIDENFABRIK 102     // droiden bauen
#constant BUILDINGHIGHTECHFABRIK 103   // forschungsobjekte und hightechmaterialien bauen
#constant BUILDINGWAFFENFABRIK 104     // ausrüstung für bodentruppen bauen
#constant BUILDINGKASERNE 1          // planetare ausbildungsstätte um truppen und besatzung auszubilden
#constant BUILDINGPSIOPSKASERNE 1    // planetare ausbildungsstätte für spezialkräfte
#constant BUILDINGWERFT 1            // werft für jäger sowie leichtere und mittlere schiffe
#constant BUILDINGKONSULAT 1         // diplomaten ausbilden
#constant BUILDINGRAUMHAFEN 1        // handel transport versorung von orbital objekten
#constant BUILDINGBERGBAUMINE 1      // erze abbauen
#constant BUILDINGMINE 1             // abbau von ressourcen
#constant BUILDINGRAFFENERIE 1       // verarbeitungsstätte für ressourcen
#constant BUILDINGERNTEANLAGEN 1     // baut kristalle ab

#constant BUILDINGHANGAR 1           // planetare jägerstaffeln bereitstellen die auch in den orbit vordringen können
#constant BUILDINGFORSCHUNGSANLAGE 1 // neue technologien entsprechend der ausrichtung erforschen
#constant BUILDINGKRAFTWERK 1        // erhöht die energieausbeute des planeten

#constant BUILDINGSCHILDGENERATOR 201  // planetarer schild
#constant BUILDINGIONENKANONE 202      // schweres ionen geschütz
#constant BUILDINGLASERKANONE 203      // batterie von abwehrlaserkanonen
#constant BUILDINGPLASMAKANONE 204     // schweres palsma geschütz
#constant BUILDINGRAKETENSILO 205      // für angriffe auf großkampfschiffe

#constant BUILDINGORBITALFABRIK 301    // orbital objekte bauen
#constant BUILDINGORBITALWERFT 1     // großkampfschiffe bauen
#constant BUILDINGBERGBAUSTATION 1   // ermöglich resourcengewinnung von asteroiden
#constant BUILDINGORBITALRAFENERIE 1 // verarbeitet ressourcen im orbit
#constant BUILDINGORBITALERNTEANLAGEN 1 // baut kristalle ab
#constant BUILDINGORBITALRAUMDOCKS 1 // unterstützen den planetaren raumhafen
#constant BUILDINGORBITALKAMPFSTATION 1 // raumstation zur bekämpfung feindlicher kampfschiffe und jäger
#constant BUILDINGORBITALSATELLITENNETZ 1 // informationen
#constant BUILDINGORBITALKRAFTWERK 1      // erhöht die energieausbeute des planeten
#constant BUILDINGORBITALFORSCHUNGSSTATION 1

#constant ADDONHANGAR 1
#constant ADDONDOCKS 1
#constant ADDONLAZARET 1
#constant ADDONBUNKERANLAGEN 1
#constant ADDONCRYSTSALSILO 1
#constant ADDONERNTERHANGER 1
#constant ADDONCARRIERHANGER 1

//--------------------------------------------------------------
//
//--------------------------------------------------------------

type TBuilding
	
	Unit as TUnit
	BuildingType as integer
	
	MaxBuildingAddonCount as integer
	BuildingAddonList as TBuildingAddon[-1]
	
endtype

//--------------------------------------------------------------
//
//--------------------------------------------------------------

function BuildingSet(Building ref as TBuilding,BuildingType as integer)
	
	Select BuildingType
		case BUILDINGFABRIK
			Building.BuildingType = BuildingType
			Building.MaxBuildingAddonCount = 6
		endcase
	endselect
	
endfunction

//--------------------------------------------------------------
//
//--------------------------------------------------------------


