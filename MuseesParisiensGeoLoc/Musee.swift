//
//  Musee.swift
//  MuseesParisiensGeoLoc
//
//  Created by Clement Combier on 10/11/2021.
//

import UIKit
import CoreLocation
import MapKit

class Musee: NSObject {
    var nom:String
    var coordonnee: CLLocationCoordinate2D
    var adresseBilleterie : URL?
    
    init(_ nom:String, _ coord:CLLocationCoordinate2D, _ adresse:String){
        self.nom=nom
        self.coordonnee=coord
        
        //Création d'une URL grace à la variable de type String adresse
        let adresseAsUrl = URL(string: adresse)
        self.adresseBilleterie = adresseAsUrl
    }
    
    static func donneTous()->[Musee]{
        let musees = [
            Musee("Musée du Louvre",CLLocationCoordinate2D(latitude: 48.864824, longitude: 2.334595),"https://www.google.com/search?client=safari&rls=en&q=musee+louvre+billeterie&ie=UTF-8&oe=UTF-8"),
            Musee("Musée d'Orsay",CLLocationCoordinate2D(latitude: 48.859961, longitude: 2.326561),"https://billetterie.musee-orsay.fr/fr-FR/accueil"),
            Musee("Musée du quai Branly",CLLocationCoordinate2D(latitude: 48.860310, longitude: 2.325164),"https://www.quaibranly.fr/fr/billetterie/")
        ]
    
        return musees
    }
    
    
}
extension Musee:MKAnnotation{
    var coordinate: CLLocationCoordinate2D{
        return coordonnee
    }
    var title:String?{
        return nom
    }
}
