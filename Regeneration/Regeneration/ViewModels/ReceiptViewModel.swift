//
//  ReceiptViewModel.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 06/02/22.
//

import Foundation

import UIKit
import SwiftUI
import Combine

class ReceiptViewModel: ObservableObject {
    @Published var name = ""
    @Published var isEmpty = true
    @Published var titleName = "Add Receipt"
    var receipts: [Receipt] = []

    init() {
        checkReceipt()
    }
    
    func checkReceipt() {
        receipts = ReceiptCoreDataManager.shared.getAll()
        if receipts.count > 0 {
            self.isEmpty = false
        } else {
            self.isEmpty = true
        }
    }
    
    func createReceipt() {
        let receipt = Receipt(context: ReceiptCoreDataManager.shared.persisntentContainer.viewContext)
        receipt.name = self.name
        ReceiptCoreDataManager.shared.save()
        receipts = ReceiptCoreDataManager.shared.getAll()
        checkReceipt()
    }
}
