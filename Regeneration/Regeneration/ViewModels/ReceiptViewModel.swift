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
    var receipts: [Receipt] = []

    init() {
        receipts = ReceiptCoreDataManager.shared.getAll()
        if receipts.count > 0 {
            self.isEmpty = false
//            self.name = profiles.first?.name! ?? ""
//            self.email = profiles.first?.email ?? ""
//            self.phone = profiles.first?.phone ?? ""
//            self.photoData = profiles.first?.photo ?? Data()
//            self.photo = Image(uiImage: UIImage(data: (profiles.first?.photo) ?? Data()) ?? UIImage())
        }
    }
}
