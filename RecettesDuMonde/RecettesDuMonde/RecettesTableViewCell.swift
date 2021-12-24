//
//  RecettesTableViewCell.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//

import UIKit

class RecettesTableViewCell: UITableViewCell {

    @IBOutlet weak var recetteImgView: UIImageView!
    @IBOutlet weak var titreRecetteLab: UILabel!
    @IBOutlet weak var paysOrigineLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    @IBAction func tapBtnVoirMap(_ sender: Any) {
    }
    @IBAction func tapBtnRecette(_ sender: Any) {
    }
    
    
}
