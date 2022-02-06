//
//  ReceiptModalView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 07/02/22.
//

import SwiftUI

struct ReceiptModalView: View {
    @State var viewModel = ReceiptViewModel()
    
    func actionCancel() {
        print("CANCEL")
    }
    func actionDone() {
        print("DONE")
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
            
            .navigationBarTitle("Edit Product", displayMode: .inline)
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

struct ReceiptModalView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptModalView()
    }
}
