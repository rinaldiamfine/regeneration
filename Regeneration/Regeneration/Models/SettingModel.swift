//
//  SettingView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import Foundation
import CoreData

class ProfileCoreDataManager {
    let persisntentContainer: NSPersistentContainer
    static let shared = ProfileCoreDataManager()
    var viewContext: NSManagedObjectContext {
        return persisntentContainer.viewContext
    }

    private init() {
        persisntentContainer = NSPersistentContainer(name: "Regeneration")
        persisntentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unable to initialize coredata stack \(error)")
            }
        }
    }

    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }

    func getAll() -> [Profile] {
        let request: NSFetchRequest<Profile> = Profile.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }

    func getProfileById(objectId: NSManagedObjectID) -> Profile? {
        do {
            return try viewContext.existingObject(with: objectId) as? Profile
        } catch {
            return nil
        }
    }
}
