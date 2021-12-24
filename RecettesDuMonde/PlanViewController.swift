//
//  ViewController.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//

import UIKit
import MapKit

class PlanViewController: UIViewController {
    
    @IBOutlet weak var plan: MKMapView!
    static let identifiantAnnotationPays = "pays"
    
    //Get information
    var lesPays : [PaysMO] = []
    var lesIngredients : [IngredientMO] = []
    var lesRecettes : [RecetteMO] = []
    
    var latitudeToShow = 46.23
    var longitudeToShow = 2.20
    var spanZoomFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lesPays = PaysMO.getTousLesPays()
        lesRecettes = RecetteMO.getToutesLesRecettes()
        
        let posToShow = CLLocationCoordinate2D(latitude: latitudeToShow, longitude: longitudeToShow)
        let spanSuperZoom = MKCoordinateSpan(latitudeDelta: spanZoomFloat, longitudeDelta: spanZoomFloat)
       
        
        plan.mapType = .hybrid
        plan.addAnnotations(lesPays)
        plan.region = MKCoordinateRegion(center: posToShow, span: spanSuperZoom)
        
    }
    
    func setLatitudeToShow(_ latitude: Double){
        self.latitudeToShow = latitude
    }
    func setLongitudeToShow(_ longitude: Double){
        self.longitudeToShow = longitude
    }
    

}
extension PlanViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        guard let unPaysOrigine = annotation as? PaysMO else {return nil}
        let vueAnnotation : MKAnnotationView
        if let recyclee = mapView.dequeueReusableAnnotationView(withIdentifier: PlanViewController.identifiantAnnotationPays)
        {
            recyclee.annotation=annotation
            vueAnnotation = recyclee
        }else{
            vueAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: PlanViewController.identifiantAnnotationPays)
            vueAnnotation.canShowCallout=true
            return vueAnnotation
        }
        vueAnnotation.canShowCallout=true
        return vueAnnotation
    }
    
    
}
