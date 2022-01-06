//
//  Site.swift
//  CoffreFort

//  Created by Clement Combier on 22/09/2021.
//

import Foundation

class Site:Codable{
    
    private var nom: String
    private var mdp: String
    
    //constructeur
   public init(_ nom: String, _ mdp: String) {
        self.nom = nom
        self.mdp = mdp
    }
    
    
    public static func valoriserTousLesSites()->[Site]{
        let sites = loadJSON()
        
        return sites//Return tqblequ de site
    }
    
    //Getters & Setters
    func getNom() -> String{
        return self.nom
    }
    func setNom(_ nom: String){
        self.nom = nom
    }
    
    func getMdp() -> String{
        return self.mdp
    }
    func setMdp(_ mdp : String){
        self.mdp = mdp
    }
    
    
    //On charge notre fichier json pour la lecture de nos donnees sauvegardees
    public static func loadJSON()-> [Site]{
        var tousLesSites : [Site] = []
        
        let url =
        FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!.appendingPathComponent("CoffreFort.json")
       
        if FileManager.default.fileExists(atPath: url.path){
        // le Fichier existe
            tousLesSites = chargerJSON(uneURL : url)!
        } else {
            print("Le fichier CoffreFort.json n'existe pas!")
        }
        
        return tousLesSites
    }
    
    //On ecrit dans le fichier json pour sauvegardre nos donnees
    public static func writeJSON(allSites : [Site]){
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("CoffreFort.json")
        
        let data = try? JSONEncoder().encode(allSites)
        
         // Création du fichier
        FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
    }
     
    //Charger un fichier json pour la lecture
    public static func chargerJSON(uneURL : URL) ->[Site]?{
        do {
            let data = try Data(contentsOf: uneURL)
            let decoder = JSONDecoder()
            
            let allSites = try decoder.decode([Site].self, from: data)
            
            //Retounr tout les sites
            return allSites
            
            } catch { //RETOURNE ERREUR AVEC LE TYPE ERREUR SI UNE ERREUR EST RENCONTREE
                print ("Erreur : \(error)")
            }
        
        return nil
    }
}
