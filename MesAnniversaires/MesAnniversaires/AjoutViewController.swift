//
//  ViewController.swift
//  MesAnniversaires
//
//  Created by Clement Combier on 13/10/2021.
//

import UIKit

class AjoutViewController: UIViewController {

    //Déclaration des outlets
    @IBOutlet weak var nomTF: UITextField!
    @IBOutlet weak var prenonTF: UITextField!
    @IBOutlet weak var dateDeNaissanceTF: UITextField!
    @IBOutlet weak var rechercheTF: UITextField!
    
    private let leContexte = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "afficheTousLesAnniversaires"){
            let listeView = segue.destination as! AfficheTousTVC
            
            listeView.setTousLesAnniversaires(AnniversaireMO.tousLesAnniversaires())
        }
    }

    @IBAction func tapSurRechercher(_ sender: Any) {
        let recherche = rechercheTF.text!
        let objAnniv = AnniversaireMO.getLesAnniversairesPredicat(recherche)
        
        nomTF.text = objAnniv[0].nom
        prenonTF.text = objAnniv[0].prenom
        dateDeNaissanceTF.text = objAnniv[0].ddn
    }
    @IBAction func tapSurAjouter(_ sender: Any) {
        let nomString = nomTF.text!
        let prenomString = prenonTF.text!
        let ddnString = dateDeNaissanceTF.text!
        
        let objAnniv = AnniversaireMO(context: leContexte)
        objAnniv.nom = nomString
        objAnniv.prenom = prenomString
        objAnniv.ddn = ddnString
        
        do{
            try self.leContexte.save()
        }catch{
            print("")
        }
        
    }
    @IBAction func tapSurAfficher(_ sender: Any) {
        performSegue(withIdentifier: "afficheTousLesAnniversaires", sender: nil)
    }
    
    func RAZ(){
        nomTF.text = ""
        prenonTF.text = ""
        dateDeNaissanceTF.text = ""
        
    }
}

