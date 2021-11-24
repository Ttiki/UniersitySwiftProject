//
//  IngredientMO+CoreDataProperties.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//
//

import Foundation
import CoreData


extension IngredientMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientMO> {
        return NSFetchRequest<IngredientMO>(entityName: "Ingredient")
    }

    @NSManaged public var ingredient_nom: String?
    @NSManaged public var ingredient_descr: String?
    @NSManaged public var ses_recettes: NSSet?

}

// MARK: Generated accessors for ses_recettes
extension IngredientMO {

    @objc(addSes_recettesObject:)
    @NSManaged public func addToSes_recettes(_ value: RecetteMO)

    @objc(removeSes_recettesObject:)
    @NSManaged public func removeFromSes_recettes(_ value: RecetteMO)

    @objc(addSes_recettes:)
    @NSManaged public func addToSes_recettes(_ values: NSSet)

    @objc(removeSes_recettes:)
    @NSManaged public func removeFromSes_recettes(_ values: NSSet)

}

extension IngredientMO : Identifiable {

}
