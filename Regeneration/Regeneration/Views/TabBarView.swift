//
//  TabBarView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = 1
    @State var showHeader = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ReceiptView()
                .tabItem {
                    Image(systemName: "doc")
                    Text("Receipts")
                }
                .tag(1)
            CustomerView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Customers")
                }
                .tag(2)
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .tag(3)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
