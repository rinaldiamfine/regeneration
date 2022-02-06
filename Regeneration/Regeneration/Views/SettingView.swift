//
//  SettingView.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 21/01/22.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    @State var editMode: Bool = false
    @State var editText: String = "Edit"
    @State private var presentImagePicker = false
    @State private var presentActionScheet = false
    @State private var presentCamera = false
    @State private var showNotif = false
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    HStack {
                        if editMode {
                            VStack {
                                if viewModel.photo == Image("") || viewModel.photo == Image(
                                    uiImage: UIImage(
                                        data: Data()) ?? UIImage()
                                ) {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
                                        .padding(.trailing, 10)
                                        .onTapGesture {
                                            presentActionScheet = true
                                        }
                                } else {
                                    viewModel.photo?
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .padding(.trailing, 10)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
                                        .onTapGesture {
                                            presentActionScheet = true
                                        }
                                }
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                TextField("Your name", text: $viewModel.name)
                                    .font(.headline)
                                TextField("Email address", text: $viewModel.email)
                                    .font(.caption)
                                TextField("Phone number", text: $viewModel.phone)
                                    .font(.caption)
                            }
                        } else {
                            VStack {
                                if viewModel.photo == Image("") || viewModel.photo == Image(
                                    uiImage: UIImage(
                                        data: Data()) ?? UIImage()
                                ) {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .padding(.trailing, 10)
                                } else {
                                    viewModel.photo?
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .padding(.trailing, 10)
                                        .clipShape(Circle())
                                }
                            }
                            VStack(alignment: .leading, spacing: 6.5) {
                                Text(viewModel.name).font(.headline)
                                Text(viewModel.email).font(.caption)
                                Text(viewModel.phone).font(.caption)
                            }
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                } header: {
                    Text("Profile")
                }
                
                Section {
                    Toggle("Notif me when ...", isOn: $showNotif)
                } header: {
                    Text("Notifications")
                }
                
                Section {
                    ScrollView(.horizontal) {
                        HStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 125, height: 150)
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 125, height: 150)
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 125, height: 150)
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 125, height: 150)
                        }
                        .padding(.vertical, 10)
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
                    NavigationLink(destination: SettingContent()) {
                        HStack {
                            Text("Papper Size")
                        }
                    }
                } header: {
                    Text("Companies")
                }
                
                HStack {
                    Text("Copyright @ XXX")
                }

            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        editMode.toggle()
                        if editMode {
                            editText = "Done"
                        } else {
                            editText = "Edit"
                            viewModel.updateProfile()
                        }
                    } label: {
                        Text(editText)
                    }
                }

            }
            .sheet(isPresented: $presentImagePicker) {
                ImagePickerView(
                    sourceType: presentCamera ? .camera : .photoLibrary,
                    image: $viewModel.photo,
                    isPresented: $presentImagePicker,
                    imageData: $viewModel.photoData)
                }
                .actionSheet(isPresented: $presentActionScheet) { () -> ActionSheet in
                    ActionSheet(
                        title: Text("Please choose your preferred mode to set your profile image"),
                        buttons: [
                            ActionSheet.Button.default(
                                Text("Camera"),
                                action: {
                                    self.presentImagePicker = true
                                    self.presentCamera = true
                                }),
                            ActionSheet.Button.default(
                                Text("Photo Library"),
                                action: {
                                    self.presentImagePicker = true
                                    self.presentCamera = false
                                }),
                            ActionSheet.Button.cancel()
                        ]
                    )
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
