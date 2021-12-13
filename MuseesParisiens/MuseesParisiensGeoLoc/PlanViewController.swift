//
//  MapViewController.swift
//  MuseesParisiensGeoLoc
//
//  Created by Clement Combier on 10/11/2021.
//

import UIKit
import MapKit

class PlanViewController: UIViewController {

    @IBOutlet weak var plan: MKMapView!
    static let identifiantAnnotationMusee = "musee"
    var listeMusees : [Musee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Récup les musées
        listeMusees = Musee.donneTous()
        
        plan.mapType = .hybrid
        plan.addAnnotations(listeMusees)
    }


}
extension PlanViewController : MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let unMusee = annotation as? Musee else {return nil}
        let vueAnnotation : MKAnnotationView
        if let recyclee = mapView.dequeueReusableAnnotationView(withIdentifier: PlanViewController.identifiantAnnotationMusee){
            recyclee.annotation = annotation
            vueAnnotation = recyclee
        }else{
            vueAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: PlanViewController.identifiantAnnotationMusee)
            vueAnnotation.canShowCallout = true
            return vueAnnotation
        }
        vueAnnotation.canShowCallout = true
        return vueAnnotation
    }
    
    func mapView(_ mapView: MKMapView, didSelect view:MKAnnotationView){
        let Paris = CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333) // A changer
        let spanSuperZoom = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        plan.region = MKCoordinateRegion(center: Paris, span: spanSuperZoom)
    }
}
