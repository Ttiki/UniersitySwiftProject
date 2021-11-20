//
//  PersonneMO+CoreDataProperties.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//
//

import Foundation
import CoreData


extension PersonneMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonneMO> {
        return NSFetchRequest<PersonneMO>(entityName: "Personne")
    }

    @NSManaged public var nom: String?
    @NSManaged public var prenom: String?
    @NSManaged public var idPers: Int64

}

extension PersonneMO : Identifiable {

}
