//
//  ReceiptView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct ReceiptView: View {
    @State var index = 0
    @State var show = false
    @State var contentReceipt = ["Today", "Month", "All"]
    
    var body: some View {
        VStack(spacing: 0){
            NavigationViewCustom(index: self.$index,show: self.$show)
            ZStack{
                ReceiptContent(titleName: "Today", show: self.$show).opacity(self.index == 0 ? 1 : 0)
                ReceiptContent(titleName: "1 Month", show: self.$show).opacity(self.index == 1 ? 1 : 0)
                ReceiptContent(titleName: "All", show: self.$show).opacity(self.index == 2 ? 1 : 0)
            }
        }
        .edgesIgnoringSafeArea(.top)
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
