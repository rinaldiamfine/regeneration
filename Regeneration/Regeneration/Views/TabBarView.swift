//
//  TabBarView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ReceiptView()
                .tabItem {
                    Image(systemName: "doc")
                    Text("Receipt")
                }
                .tag(1)
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .tag(2)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
