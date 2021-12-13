//
//  ViewController.swift
//  Cliqueur
//
//  Created by Clement Combier on 15/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labCompteur: UILabel!
    @IBOutlet weak var butMoins: UIButton!
    private var compteur: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testCompteur()
    }

    @IBAction func tapButPlus(_ sender: Any) {
        compteur += 1
        testCompteur()
    }
    @IBAction func tapButMoins(_ sender: Any) {
        compteur -= 1
        testCompteur()
    }
    @IBAction func tapButRAZ(_ sender: Any) {
        compteur = 0
        testCompteur()
    }
    
    private func testCompteur(){
        if(compteur == 0){
            desactiverBtnMoins()
        }else{
            activerBtnMoins()
        }
        labCompteur.text = String(compteur)
    }
    
    private func desactiverBtnMoins() {
        butMoins.isEnabled = false
    }
    private func activerBtnMoins(){
        butMoins.isEnabled = true
    }
}

