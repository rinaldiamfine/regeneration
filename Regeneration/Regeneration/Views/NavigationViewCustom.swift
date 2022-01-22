//
//  NavigationView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct NavigationViewCustom:View {
    
    @Binding var index : Int
    @Binding var show : Bool
    
    var body : some View{
        VStack(spacing: 25){
            if self.show{
                HStack{
                    Text("Regeneration")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button(action: {
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    }
                    Button(action: {
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }.padding(.leading)
                }
            }
            
            HStack{
                Button(action: {
                    self.index = 0
                }) {
                    VStack{
                        Text("Today")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        Capsule().fill(self.index == 0 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    self.index = 1
                }) {
                    VStack{
                        Text("Month")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 1 ? .bold : .none)
                        
                        Capsule().fill(self.index == 1 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    self.index = 2
                }) {
                    VStack{
                        Text("Year")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 2 ? .bold : .none)
                        
                        Capsule().fill(self.index == 2 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
            }.padding(.bottom, 10)
        }
        .padding(.horizontal)
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
        .background(Color("Color"))
    }
}
