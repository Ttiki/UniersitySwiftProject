//
//  LectureTableViewController.swift
//  CoffreFort
//
//  Created by Clement Combier on 29/09/2021.
//

import UIKit

class LectureTableViewController: UITableViewController {

    
    struct Sections {
        let letter : String //keys
        let sites : [Site] //values
    }
    private var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    private var lesSites : [Site] = []
    
    //Déclaration d'un tableau de struct Sections
    private var sections = [Sections]()
    
    
    var unRefreshControl : UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On récupère la liste des sites de la collectionSite du AppDelegate
        lesSites = AppDelegate.getCollectionSites()
        
        //Ranger les sites par sections
        rangerSitesParSections()

    
        //Créer un nouvel objet UIRefreshControl
        unRefreshControl = UIRefreshControl()
        //Ajoute une action de glisser vers le haut pour rafraichir
        //Si l'utilisateur glisse l'écrqn vers le haut on lance une action
        unRefreshControl.attributedTitle = NSAttributedString(string:"Glisser pour rafraichir")
        unRefreshControl.addTarget(self, action:
                                    #selector(LectureTableViewController.rechargerTableView), for: UIControl.Event.valueChanged)
        self.tableView.addSubview(self.unRefreshControl)
        
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(lesSites.count)
        return sections[section].sites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell = "celluleSite"
        var leSite : Site
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        let section = sections[indexPath.section]
        
        leSite = section.sites[indexPath.row]
        cell.textLabel?.text =  leSite.getNom()
        cell.detailTextLabel?.text = leSite.getMdp()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return sections[section].letter
    }
    
    //Fonction pour rafraichir la liste des sites lesSites en utilisant la fonction getCollectionSites de AppDelegate.
    //Reload la tableau et les données pour rafraichir la vue
    @objc func rechargerTableView(){
        self.lesSites = AppDelegate.getCollectionSites()
        
        rangerSitesParSections()
        
        self.tableView.reloadData()
        self.unRefreshControl.endRefreshing()
    }
    
    
    func rangerSitesParSections(){
        //On groupe les sites par le première lettre grâce au dictionnaire
        //Création d'un dictionnaire et rangement de ce dernier grâce aux sites lesSites
        let groupedByDictionnary = Dictionary(grouping: lesSites, by: {String($0.getNom().prefix(1).uppercased())})
        //Un dico est compo de: {key, value}
        let keys = groupedByDictionnary.keys.sorted()
        //On rentre les "sorted keys" dans le tableau de struct

        sections = keys.map{ Sections(letter: $0, sites: groupedByDictionnary[$0]!)}
    }
    /*func rangerSitesParSections(_ site : Site){
        var sectionId = 0
        for section in lesSections {
            print(section)
            if(section.lowercased() == site.getNom().prefix(1)){
                lesSitesParSections[sectionId].append(site)
                print(site.getNom().prefix(1))
            }
            sectionId = sectionId + 1
        }
    }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }*/
    

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
