//
//  TauxAlcoolemieViewController.swift
//  RestezBonneForme
//
//  Created by Clement Combier on 15/09/2021.
//

import UIKit

class TauxAlcoolemieViewController: UIViewController {

    @IBOutlet weak var poidsInput: UITextField!
    @IBOutlet weak var nbVerresInput: UITextField!
    @IBOutlet weak var degInput: UITextField!
    @IBOutlet weak var typeSwitch: UISegmentedControl!
    @IBOutlet weak var tauxLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func calculerTaux(_ lePoids : Double,_ laQte : Int,_ leDeg : Double,_ leType : Int) -> Double{
        var taux: Double = 0
        var leCoeff: Double = 0
        
        if(leType == 0){
            leCoeff = 0.7
        }else{
            leCoeff = 0.6
        }
        
        taux = Double(laQte) * leDeg * 0.8 / (lePoids * leCoeff)
        return taux
    }
    @IBAction func tapBtnCalculerTaux(_ sender: Any) {
        let lePoids = Double(poidsInput.text!) ?? 0
        let nbVerres =  Int(nbVerresInput.text!) ?? 0
        let deg = Double(degInput.text!) ?? 0
        let typeSwitch = typeSwitch.selectedSegmentIndex
        var leTaux: Double = 0
        
        leTaux = calculerTaux(lePoids, nbVerres, deg, typeSwitch)
        
        tauxLab.text = String(leTaux)
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
