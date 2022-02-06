//
//  ReceiptView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct ReceiptView: View {
    @State var contentReceipt = ["Today", "Month", "All"]
    
    var body: some View {
        NavigationView {
            Section() {
                List(0...25, id: \.self) { i in
                    CellView()
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}

struct ReceiptContent : View {
    @State var titleName: String
    @Binding var show : Bool
    var body : some View{
        List(0...25,id: \.self){i in
            if i == 0{
                CellView()
                .onAppear {
                    withAnimation {
                        self.show = true
                    }
                }
                .onDisappear {
                    withAnimation {
                        self.show = false
                    }
                }
            }
            else{
               CellView()
            }
        }
    }
}

struct CellView : View {
    var body : some View{
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("Title")
                Text("Subtitle").font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}
