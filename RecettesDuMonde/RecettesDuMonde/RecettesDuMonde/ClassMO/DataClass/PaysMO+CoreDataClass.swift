//
//  PaysMO+CoreDataClass.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//

import Foundation
import CoreData
import CoreLocation
import MapKit


public class PaysMO: NSManagedObject {
    private static var tousLesPays : [PaysMO] = []
    
    static func getTousLesPays()->[PaysMO]{
        let query : NSFetchRequest<PaysMO> = fetchRequest()
        
        guard let tabPays = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(query)) else {return[]}
        
        return tabPays
    }
    
    static func rechercherPaysParNom(_ nom:String)->[PaysMO]{
        let query : NSFetchRequest<PaysMO> = fetchRequest()
        query.predicate = NSPredicate(format: "pays_nom == %@", nom)
        
        guard let tabPays = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(query)) else {return[]}
        
        return tabPays
    }
    
    static func peuplerPays(){
        let leCtxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let objPays = PaysMO(context: leCtxt)
        objPays.pays_nom = "Pays Basque"
        objPays.pays_loc_lat = 43.4831519
        objPays.pays_loc_long = -1.558626
        
        do{
            try leCtxt.save()
        } catch _ as NSError{
            print("Impossible d'effectuer la sauvegarde")
        }
    }
}

