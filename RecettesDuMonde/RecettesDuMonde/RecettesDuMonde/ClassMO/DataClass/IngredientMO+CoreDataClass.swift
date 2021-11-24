//
//  IngredientMO+CoreDataClass.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//
//

import Foundation
import CoreData
import UIKit


public class IngredientMO: NSManagedObject {
    private static var tousLesIngredients : [IngredientMO] = []
    
    static func getTousLesIngredients()->[IngredientMO]{
        let query : NSFetchRequest<IngredientMO> = fetchRequest()
        
        guard let tabIngredients = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(query)) else {return[]}
        
        return tabIngredients
    }
    
    static func peuplerIngredients(){
        let leCtxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let objIngredients1 = IngredientMO(context: leCtxt)
        //Premier ingredient
        objIngredients1.ingredient_nom = "Poulet"
        objIngredients1.ingredient_descr = "Un bon poulet fermier"
        
        //Deuxieme ingredient
        let objIngredients2 = IngredientMO(context: leCtxt)
        objIngredients2.ingredient_nom = "Piment d'Espelette"
        objIngredients2.ingredient_descr = "Un bon piment d'Espelette d'Espelette"
        
        //Troisieme ingredient
        let objIngredients3 = IngredientMO(context: leCtxt)
        objIngredients3.ingredient_nom = "Piperade"
        objIngredients3.ingredient_descr = "Ce n'est pas de la simple sauce tomate!"
        
        
        
        
        do{
            try leCtxt.save()
        } catch _ as NSError{
            print("Impossible d'effectuer la sauvegarde")
        }
    }
}
