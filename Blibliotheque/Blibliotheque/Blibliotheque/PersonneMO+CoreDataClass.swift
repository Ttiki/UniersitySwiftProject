//
//  PersonneMO+CoreDataClass.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//
//

import Foundation
import CoreData
import UIKit


public class PersonneMO: NSManagedObject {
    private static var tabPersonnes : [PersonneMO] = []

    static func toutesLesPersonnes() -> [PersonneMO]{
        let query : NSFetchRequest<PersonneMO> = fetchRequest()
        
        guard let tabPersonnes = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(query)) else {return[]}
        
        return tabPersonnes
    }
    
    static func chercherPersonnes(_ querry : String) -> [PersonneMO]{
        let objAppDelegate = UIApplication.shared.delegate as! AppDelegate
        let leMagPersistant = objAppDelegate.persistentContainer
        let leCtxt = leMagPersistant.viewContext
        let maRequete : NSFetchRequest<PersonneMO> = PersonneMO.fetchRequest()
        maRequete.predicate = NSPredicate(format: "nom == %@", querry)
        guard let lesPersonne = try? (leCtxt.fetch(maRequete)) else { return []}
        return lesPersonne
    }
}
