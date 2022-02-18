//
//  ReceiptModalView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 07/02/22.
//

import SwiftUI

struct ReceiptModalView: View {
    @ObservedObject var viewModel: ReceiptViewModel
    @Binding var isPresented: Bool
    
    func actionCancel() {
        isPresented = false
    }
    func actionDone() {
        viewModel.createReceipt()
        isPresented = false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Receipt No.", text: $viewModel.name)
                    TextField("Customer", text: $viewModel.name)
                    TextField("Amount Receive", text: $viewModel.name)
                } header: {
                    Text("Receipt Information")
                }
                Section {
                    TextField("Receipt No.", text: $viewModel.name)
                    TextField("Customer", text: $viewModel.name)
                } header: {
                    Text("Date Information")
                }
            }
            
            .navigationBarTitle(viewModel.titleName, displayMode: .inline)
            .navigationBarItems(
                leading:
                    Button(action: actionCancel, label: {
                        Text("Cancel")
                    }),
                trailing:
                    Button(action: actionDone, label: {
                        Text("Done")
                    })
            )
        }
    }
}

//struct ReceiptModalView_Previews: PreviewProvider {
//    @State var isPresented = true
//    static var previews: some View {
//        ReceiptModalView(isPresented: $isPresented)
//    }
//}
