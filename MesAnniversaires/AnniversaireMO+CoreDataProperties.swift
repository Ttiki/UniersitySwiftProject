//
//  AnniversaireMO+CoreDataProperties.swift
//  MesAnniversaires
//
//  Created by Clement Combier on 13/10/2021.
//
//

import Foundation
import CoreData


extension AnniversaireMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnniversaireMO> {
        return NSFetchRequest<AnniversaireMO>(entityName: "Anniversaire")
    }

    @NSManaged public var ddn: String?
    @NSManaged public var nom: String?
    @NSManaged public var prenom: String?

}

extension AnniversaireMO : Identifiable {

}
