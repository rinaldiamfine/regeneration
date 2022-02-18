//
//  ReceiptView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct ReceiptView: View {
    @ObservedObject var viewModel = ReceiptViewModel()
    @State private var currentFilter = "Today"
    @State var receiptFilters = ["Today", "Month", "All"]
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    if viewModel.isEmpty {
                        ReceiptContentEmptyView()
                    }
                    else {
                        ScrollView {
                            Picker("Receipt filter", selection: $currentFilter) {
                                ForEach(receiptFilters, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding()
                            ForEach(viewModel.receipts, id: \.objectID) { receipt in
                                ReceiptContentView(receiptModel: receipt)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }

                }
                .sheet(isPresented: $isPresented) {
                    ReceiptModalView(viewModel: viewModel, isPresented: $isPresented)
                }
                .navigationTitle("Receipts")
            }
        }
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}

struct ReceiptContentEmptyView: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "questionmark.folder")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .background(
                        Circle()
                            .fill(.tertiary)
                            .frame(width: 140, height: 140)
                )
                Spacer()
            }
            .padding()
            
            HStack(alignment: .center) {
                VStack(alignment: .center, spacing: 5) {
                    Text("Receipt was not found")
                        .font(.headline)
                    Text("There is no receipt data to show you right now")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ReceiptContentView : View {
    @State var receiptModel: Receipt
    var body : some View{
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 5) {
                Text(receiptModel.name ?? "").font(.headline)
                Text("Subtitle").font(.caption)
//                Text("Total").font(.caption)
            }
            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(LinearGradient(
                    gradient: .init(colors: [Color.gray]),
                    startPoint: .init(x: 0, y: 0),
                    endPoint: .init(x: 0, y: 0.9)
                ))
        )
    }
}
