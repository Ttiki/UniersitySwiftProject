//
//  AjoutTableViewController.swift
//  CoffreFort
//
//  Created by Clement Combier on 29/09/2021.
//

import UIKit

class AjoutTableViewController: UIViewController {

    
    @IBOutlet weak var inputNomSite: UITextField!
    @IBOutlet weak var inputMdp: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Sauvegarde le site dans le fichier json
    @IBAction func tapSurSauvegarder(_ sender: Any) {
        Site.writeJSON(allSites: AppDelegate.getCollectionSites())
    }
    
    //Ajoute le site dans la liste
    @IBAction func tapSurAjouter(_ sender: Any) {
        let inputSiteVal = inputNomSite.text!
        let inputMdpVal = inputMdp.text!
        let leSite = Site(inputSiteVal, inputMdpVal)
        
        AppDelegate.ajoute(leSite)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
