//
//  Location+CoreDataProperties.swift
//  LocationNotes
//
//  Created by Алекс Смык on 15.06.22.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lon: Double
    @NSManaged public var note: Note?

}

extension Location : Identifiable {

}
