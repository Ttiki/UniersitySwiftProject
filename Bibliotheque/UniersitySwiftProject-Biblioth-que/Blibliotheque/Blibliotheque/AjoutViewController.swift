//
//  ViewController.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//

import UIKit

class AjoutViewController: UIViewController {

    @IBOutlet weak var nomTI: UITextField!
    @IBOutlet weak var prenomTI: UITextField!
    @IBOutlet weak var titreTI: UITextField!
    @IBOutlet weak var dateEmpruntPicker: UIDatePicker!
    
    private let leContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapAjouter(_ sender: Any) {
        let nomString = nomTI.text!
        let prenomString = prenomTI.text!
        let titreString = titreTI.text!
        let dateEmprunt = dateEmpruntPicker.date
        
        let objPersonne = PersonneMO(context: leContext)
        objPersonne.nom = nomString
        objPersonne.prenom = prenomString

        let objEmprunt = EmpruntMO(context: leContext)
        //objEmprunt.personne = objPersonne
        objEmprunt.titre = titreString
        objEmprunt.dateEmprunt = dateEmprunt
        
        do{
            try self.leContext.save()
        }catch{
            print("")
        }
        
        
    }

}

