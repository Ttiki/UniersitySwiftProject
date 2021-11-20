//
//  EmpruntCell.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//

import UIKit

class EmpruntCell: UITableViewCell {

    @IBOutlet weak var nomPrenom: UILabel!
    @IBOutlet weak var titreLivre: UILabel!
    @IBOutlet weak var dateEmpruntLab: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
