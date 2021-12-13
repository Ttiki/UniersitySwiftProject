//
//  RecetteMO+CoreDataProperties.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//
//

import Foundation
import CoreData


extension RecetteMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecetteMO> {
        return NSFetchRequest<RecetteMO>(entityName: "Recette")
    }

    @NSManaged public var recette_nom: String?
    @NSManaged public var recette_descriptions: String?
    @NSManaged public var recette_pays_origine: String?
    @NSManaged public var ses_ingredients: NSSet?
    @NSManaged public var son_pays_origine: PaysMO?

}

// MARK: Generated accessors for ses_ingredients
extension RecetteMO {

    @objc(addSes_ingredientsObject:)
    @NSManaged public func addToSes_ingredients(_ value: IngredientMO)

    @objc(removeSes_ingredientsObject:)
    @NSManaged public func removeFromSes_ingredients(_ value: IngredientMO)

    @objc(addSes_ingredients:)
    @NSManaged public func addToSes_ingredients(_ values: NSSet)

    @objc(removeSes_ingredients:)
    @NSManaged public func removeFromSes_ingredients(_ values: NSSet)

}

extension RecetteMO : Identifiable {

}

