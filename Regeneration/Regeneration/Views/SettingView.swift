//
//  SettingView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct SettingView: View {
    @State var index = 0
    @State var show = false
    @State var contentReceipt = ["Today", "Month", "All"]
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    HStack {
                        VStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.trailing, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Company Name").font(.headline)
                            Text("Company Address").font(.caption)
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                    
                }
                Section {
                    HStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 125, height: 150)
                    }
                    
                    NavigationLink(destination: SettingContent()) {
                        HStack {
                            Text("Available Template")
                        }
                    }
                    
                    NavigationLink(destination: SettingContent()) {
                        HStack {
                            Text("Color Brand")
                        }
                    }
                } header: {
                    Text("Receipt Template")
                }
                
                HStack {
                    Text("Copyright @ XXX")
                }

            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


struct SettingContent: View {
    var body: some View {
        Text("ASD")
    }
}
