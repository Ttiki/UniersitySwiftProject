//
//  ListeTableViewController.swift
//  MuseesParisiensGeoLoc
//
//  Created by Clement Combier on 10/11/2021.
//

import UIKit
import CoreLocation

class ListeTableViewController: UITableViewController {

    var listeMusees : [Musee] = []
    let objLocM = CLLocationManager()
    
    var localisationUtilisateur : CLLocation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listeMusees = Musee.donneTous()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        utiliserLocationSiValide(objLocM.location)
        tableView.reloadData()
        objLocM.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        objLocM.stopUpdatingLocation()
    }
    
    func utiliserLocationSiValide(_ localisation : CLLocation?){
        guard let localisation = localisation else{
            localisationUtilisateur=nil
            return
        }
        let limite : TimeInterval = 60*60
        let temp : TimeInterval = abs(localisation.timestamp.timeIntervalSinceNow)
        localisationUtilisateur = temp < limite ? localisation : nil
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listeMusees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musee", for: indexPath)
        var leMusee : Musee
        // Configure the cell...
        leMusee = listeMusees[indexPath.row]
        
        //Calcul de la distance
        let locationMusee = CLLocation(latitude: leMusee.coordonnee.latitude, longitude: leMusee.coordonnee.longitude)
        utiliserLocationSiValide(locationMusee)
        let distanceToMusee = localisationUtilisateur?.distance(from: locationMusee)
        print(locationMusee.coordinate)
        print(localisationUtilisateur?.coordinate)
        print(distanceToMusee!)
        
        cell.textLabel?.text=leMusee.nom
        cell.detailTextLabel?.text = String(distanceToMusee!)

        return cell
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
