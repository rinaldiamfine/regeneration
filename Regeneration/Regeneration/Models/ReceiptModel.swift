//
//  ReceiptModel.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 06/02/22.
//

import Foundation
import CoreData

struct ReceiptModel {
    let name: String
}

class ReceiptCoreDataManager {
    let persisntentContainer: NSPersistentContainer
    static let shared = ReceiptCoreDataManager()
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

    func getAll() -> [Receipt] {
        let request: NSFetchRequest<Receipt> = Receipt.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }

    func getReceiptById(objectId: NSManagedObjectID) -> Receipt? {
        do {
            return try viewContext.existingObject(with: objectId) as? Receipt
        } catch {
            return nil
        }
    }
}
