//
//  EmpruntMO+CoreDataProperties.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//
//

import Foundation
import CoreData


extension EmpruntMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmpruntMO> {
        return NSFetchRequest<EmpruntMO>(entityName: "Emprunt")
    }

    @NSManaged public var personne: Int64
    @NSManaged public var titre: String?
    @NSManaged public var dateEmprunt: Date?

}

extension EmpruntMO : Identifiable {

}
