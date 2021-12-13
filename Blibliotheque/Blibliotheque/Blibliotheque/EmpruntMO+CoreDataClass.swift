//
//  EmpruntMO+CoreDataClass.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//
//

import Foundation
import CoreData
import UIKit


public class EmpruntMO: NSManagedObject {
    private static var tabEmprunts : [EmpruntMO] = []
    
    static func tousLesEmprunts() -> [EmpruntMO]{
        let query : NSFetchRequest<EmpruntMO> = fetchRequest()
        
        guard let tabEmprunts = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(query)) else {return[]}
        
        return tabEmprunts
    }
    
}
