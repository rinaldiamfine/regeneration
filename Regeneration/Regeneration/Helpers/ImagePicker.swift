//
//  ImagePicker.swift
//  Regeneration
//
//  Created by Rinaldi LNU on 06/02/22.
//

import Foundation
import Combine
import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var imageData: Data?
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented, imageData: $imageData)
    }
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }
}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var imageData: Data?
    init(image: Binding<Image?>, isPresented: Binding<Bool>, imageData: Binding<Data?>) {
        self._image = image
        self._isPresented = isPresented
        self._imageData = imageData
    }
    func imagePickerController(
       _ picker: UIImagePickerController,
       didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageData = image.jpegData(compressionQuality: 1)
            self.image = Image(uiImage: image)
        }
        self.isPresented = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
}
