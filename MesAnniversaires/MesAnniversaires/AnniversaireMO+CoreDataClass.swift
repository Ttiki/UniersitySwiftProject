//
//  AnniversaireMO+CoreDataClass.swift
//  MesAnniversaires
//
//  Created by Clement Combier on 13/10/2021.
//
//

import Foundation
import CoreData
import UIKit


public class AnniversaireMO: NSManagedObject {
    
    static private var tabAnniversaires : [AnniversaireMO] = []
    
    //Charger tt les anniversaires
    static func tousLesAnniversaires() -> [AnniversaireMO]{
        
        let querry : NSFetchRequest<AnniversaireMO> = fetchRequest()
       
        guard let tabAnniversaires = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(querry)) else {return[]}
        
        return tabAnniversaires
    }
    
    //Requête Nom anniversaire == arg func nomCherche -> Chargement ds tab
    static func getLesAnniversairesPredicat(_ nomCherche:String)->[AnniversaireMO]{
        
        let querry : NSFetchRequest<AnniversaireMO> = fetchRequest()
        querry.predicate = NSPredicate(format: "Nom == %@", nomCherche)
        
        guard let tabAnniversaires = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(querry)) else {return[]}
        
        return tabAnniversaires
    }
}
