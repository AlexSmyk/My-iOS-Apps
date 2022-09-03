//
//  Note+CoreDataClass.swift
//  LocationNotes
//
//  Created by Алекс Смык on 15.06.22.
//
//

import Foundation
import CoreData
import UIKit

@objc(Note)
public class Note: NSManagedObject {
    class func newNote (name: String, inFolder: Folder?) -> Note {
        let newNote = Note(context: CoreDataManager.sharedInstance.managedObjectContext)
        newNote.name = name
        newNote.dateUpdate = Date()
        
        if let inFolder = inFolder {
            newNote.folder = inFolder
        }
        return newNote
    }
    
    var imageActual: UIImage? {
        get {
            if self.image != nil {
                if image?.imageBig != nil {
                    return UIImage(data: (self.image!.imageBig!))
                }
            }
            return nil
        }
        set {
            if newValue == nil {
                if self.image != nil {
                    CoreDataManager.sharedInstance.managedObjectContext.delete(image!)
                }
                self.imageSmall = nil
            } else {
                if self.image == nil {
                    self.image = ImageNote(context: CoreDataManager.sharedInstance.managedObjectContext)
                }
                self.image?.imageBig = newValue!.jpegData(compressionQuality: 1) as Data?
                self.imageSmall = newValue!.jpegData(compressionQuality: 0.05)
            }
            dateUpdate = Date()
        }
    }
    
    var locationActual: LocationCoordinate? {
        get {
            if self.location == nil {
                return nil
            } else {
                return LocationCoordinate(lat: self.location!.lat, lon: self.location!.lon)
            }
        }
        set {
            if newValue == nil && self.location != nil {
                //удалить локацию
                CoreDataManager.sharedInstance.managedObjectContext.delete(self.location!)
            }
            if newValue != nil && self.location != nil {
                //обновить локацию
                self.location?.lon = newValue!.lon
                self.location?.lat = newValue!.lat
            }
            if newValue != nil && self.location == nil {
                //создать локацию
                let newLocation = Location(context: CoreDataManager.sharedInstance.managedObjectContext)
                newLocation.lon = newValue!.lon
                newLocation.lat = newValue!.lat
                self.location = newLocation
            }
        }
    }
    
    func addCurrentLocation() {
        LocationManager.sharedInstance.getCurrentLocation { location in
            self.locationActual = location
            print("Got a new location:\(location)")
        }
    }
    
    func addImage(image: UIImage) {
        let imageNote = ImageNote(context: CoreDataManager.sharedInstance.managedObjectContext)
        imageNote.imageBig = image.jpegData(compressionQuality: 1)
        self.image = imageNote
        
    }
    
    func addLocation(latitude: Double, longtitude: Double) {
        let location = Location(context: CoreDataManager.sharedInstance.managedObjectContext)
        location.lat = latitude
        location.lon = longtitude
        self.location = location
    }
    var dateUpdateString: String {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        return df.string(from: self.dateUpdate!)
    }
}
