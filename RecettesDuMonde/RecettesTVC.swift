//
//  RecettesTVC.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//

import UIKit

class RecettesTVC: UITableViewController {

    var lesPays : [PaysMO] = []
    var lesIngredients : [IngredientMO] = []
    var lesRecettes : [RecetteMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        lesPays = PaysMO.getTousLesPays()
        lesRecettes = RecetteMO.getToutesLesRecettes()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lesRecettes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)-> CGFloat{
        return 70
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recetteCell", for: indexPath) as! RecettesTableViewCell

        let laRecette = lesRecettes[indexPath.row]
        
        cell.titreRecetteLab?.text=laRecette.recette_nom
        cell.paysOrigineLab?.text = laRecette.son_pays_origine?.pays_nom
        cell.recetteImgView?.image = UIImage(named:laRecette.recette_nom!.lowercased().replacingOccurrences(of: " ", with: "_"))
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "RecetteInfoViewController") as! RecetteInfoViewController
        
        let laRecette = lesRecettes[indexPath.row]
        
        vc.recetteImgView.image = UIImage(named:laRecette.recette_nom!.lowercased().replacingOccurrences(of: " ", with: "_"))
        vc.nomRecette_titreLab.text = laRecette.recette_nom
    
        
        performSegue(withIdentifier: "afficherInfos", sender: indexPath.row)
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
