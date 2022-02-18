//
//  SettingViewModel.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var photo: Image? = Image("")
    @Published var photoData: Data? = Data()
    @Published var realBirthDate = Date()
    var profiles: [Profile] = []

    init() {
        profiles = ProfileCoreDataManager.shared.getAll()
        if profiles.count > 0 {
            self.name = profiles.first?.name! ?? ""
            self.email = profiles.first?.email ?? ""
            self.phone = profiles.first?.phone ?? ""
            self.photoData = profiles.first?.photo ?? Data()
            self.photo = Image(uiImage: UIImage(data: (profiles.first?.photo) ?? Data()) ?? UIImage())
        }
    }

    func updateProfile() {
        profiles = []
        profiles = ProfileCoreDataManager.shared.getAll()
        if profiles.count > 0 {
            let profile = ProfileCoreDataManager.shared.getProfileById(objectId: profiles[0].objectID)
            profile!.name = self.name
            profile!.email = self.email
            profile!.phone = self.phone
            profile!.photo = self.photoData
            
            ProfileCoreDataManager.shared.save()
            profiles = ProfileCoreDataManager.shared.getAll()

        } else {
            let profile = Profile(context: ProfileCoreDataManager.shared.persisntentContainer.viewContext)
            profile.name = self.name
            profile.email = self.email
            profile.phone = self.phone
            profile.photo = self.photoData
            
            ProfileCoreDataManager.shared.save()
            profiles = ProfileCoreDataManager.shared.getAll()
        }
    }
}
