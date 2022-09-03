//
//  Note+CoreDataProperties.swift
//  LocationNotes
//
//  Created by Алекс Смык on 15.06.22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var name: String?
    @NSManaged public var textDescription: String?
    @NSManaged public var imageSmall: Data?
    @NSManaged public var dateUpdate: Date?
    @NSManaged public var folder: Folder?
    @NSManaged public var image: ImageNote?
    @NSManaged public var location: Location?

}

extension Note : Identifiable {

}
