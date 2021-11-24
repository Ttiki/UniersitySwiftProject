//
//  PaysMO+CoreDataProperties.swift
//  RecettesDuMonde
//
//  Created by Clement Combier on 24/11/2021.
//
//

import Foundation
import CoreData
import CoreLocation
import MapKit


extension PaysMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaysMO> {
        return NSFetchRequest<PaysMO>(entityName: "Pays")
    }

    @NSManaged public var pays_loc_lat: Double
    @NSManaged public var pays_nom: String?
    @NSManaged public var pays_loc_long: Double
    @NSManaged public var ses_recettes: NSSet?

}

// MARK: Generated accessors for ses_recettes
extension PaysMO {

    @objc(addSes_recettesObject:)
    @NSManaged public func addToSes_recettes(_ value: RecetteMO)

    @objc(removeSes_recettesObject:)
    @NSManaged public func removeFromSes_recettes(_ value: RecetteMO)

    @objc(addSes_recettes:)
    @NSManaged public func addToSes_recettes(_ values: NSSet)

    @objc(removeSes_recettes:)
    @NSManaged public func removeFromSes_recettes(_ values: NSSet)

}

extension PaysMO : Identifiable {

}

/*extension PaysMO : MKAnnotation{
    var coordinate : CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: pays_loc_lat, longitude: pays_loc_long)
    }
    var title : String?{
        return pays_nom
    }
}*/
