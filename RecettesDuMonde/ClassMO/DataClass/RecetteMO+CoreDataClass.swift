//
//  RecetteMO+CoreDataClass.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//
//

import Foundation
import CoreData
import UIKit
import MapKit


public class RecetteMO: NSManagedObject {
    private static var toutesLesRecettes : [RecetteMO] = []

    
    static func getToutesLesRecettes()->[RecetteMO]{
        let query : NSFetchRequest<RecetteMO> = fetchRequest()
        
        guard let tabRecettes = try? ((UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(query)) else {return[]}
        
        return tabRecettes
    }
    
    static func peuplerRecettes(){
        let leCtxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let objRecette = RecetteMO(context: leCtxt)
        //Premier ingredient
        objRecette.recette_nom = "Poulet basquaise"
        objRecette.recette_descriptions = "Une excellente spécialité du pays Basque"
        objRecette.son_pays_origine = PaysMO.rechercherPaysParNom("Pays Basque")[0]
        
        do{
            try leCtxt.save()
        } catch _ as NSError{
            print("Impossible d'effectuer la sauvegarde")
        }
    }
}
