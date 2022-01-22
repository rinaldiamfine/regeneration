//
//  RegenerationApp.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 20/01/22.
//

import SwiftUI

@main
struct RegenerationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
            TabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
