//
//  ImcViewController.swift
//  RestezBonneForme
//
//  Created by Clement Combier on 15/09/2021.
//

import UIKit

class ImcViewController: UIViewController {

    @IBOutlet weak var poidsInput: UITextField!
    @IBOutlet weak var tailleInput: UITextField!
    @IBOutlet weak var IMCLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func calculerIMC(_ lePoids: Int,_ laTaille: Double) -> Double{
        var IMC: Double = 0
        IMC = Double(lePoids) / pow(laTaille, 2)
        print(IMC)
        return IMC
    }
    
    private func testerIMC(_ IMC: Double){
        var color: UIColor
        var msg: String
        
        // < > & |
        if(IMC <= 18.5){
            msg = "Maigreur"
            color = UIColor(red: 50, green: 96, blue: 168, alpha: 1)
        }else if (IMC <= 24.9){
            msg = "Normal"
            color = UIColor(red:)
        }
        
        IMCLab.text = String(msg)
        IMCLab.textColor = color
    }
    
    @IBAction func tapBtnCalcImc(_ sender: Any) {
        let lePoids = Int(poidsInput.text!) ?? 0 //Text input or 0
        let laTaille = Double(tailleInput.text!) ?? 0 //Text input or 0
        var resIMC: String
        
        resIMC = (calculerIMC(lePoids, laTaille)
        
        testerIMC(resIMC)
    }
}

