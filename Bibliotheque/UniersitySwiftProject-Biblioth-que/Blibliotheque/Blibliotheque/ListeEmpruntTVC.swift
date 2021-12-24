//
//  ListeEmpruntTVC.swift
//  Blibliotheque
//
//  Created by Clement Combier on 27/10/2021.
//

import UIKit

class ListeEmpruntTVC: UITableViewController {

    
    @IBOutlet weak var searchBar: UITextField!
    
    private var tousLesEmprunts : [EmpruntMO] = []
    private var toutesLesPersonnes : [PersonneMO]=[]
    
    var unRefreshControl : UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tousLesEmprunts = EmpruntMO.tousLesEmprunts()
        toutesLesPersonnes = PersonneMO.toutesLesPersonnes()

        //Créer un nouvel objet UIRefreshControl
        unRefreshControl = UIRefreshControl()
        //Ajoute une action de glisser vers le haut pour rafraichir
        //Si l'utilisateur glisse l'écrqn vers le haut on lance une action
        unRefreshControl.attributedTitle = NSAttributedString(string:"Glisser pour rafraichir")
        unRefreshControl.addTarget(self, action:
                                           #selector(ListeEmpruntTVC.rechargerTableView), for: UIControl.Event.valueChanged)
        self.tableView.addSubview(self.unRefreshControl)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight=64
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tousLesEmprunts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empruntCell", for: indexPath) as! EmpruntCell

        let emprunts = tousLesEmprunts[indexPath.row]
        let personnes = toutesLesPersonnes[indexPath.row]

        //On s'occupe de la date pour la transformer en String et
        //pouvoir l'afficher correctement
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        let dateString = df.string(from: emprunts.dateEmprunt!)
        
        cell.nomPrenom?.text = personnes.nom! + " " + personnes.prenom!
        cell.titreLivre?.text = emprunts.titre!
        cell.dateEmpruntLab?.text = dateString

        return cell
    }

   
    //Fonction pour rafraichir la liste des sites lesSites en utilisant la fonction getCollectionSites de AppDelegate.
    //Reload la tableau et les données pour rafraichir la vue
    @objc func rechargerTableView(){
        self.toutesLesPersonnes = PersonneMO.toutesLesPersonnes()
        self.tousLesEmprunts = EmpruntMO.tousLesEmprunts()
            
        self.tableView.reloadData()
        self.unRefreshControl.endRefreshing()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    @IBAction func onTextChanged(_ sender: Any) {
        let querry = searchBar.text!
        
        if(querry == ""){
            toutesLesPersonnes = PersonneMO.toutesLesPersonnes()
            tableView.reloadData()
        }else{
            toutesLesPersonnes = PersonneMO.chercherPersonnes(querry)
            tableView.reloadData()
        }
    }
    
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
