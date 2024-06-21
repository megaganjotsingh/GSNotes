//
//  ImagePickerView.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 30/05/24.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }

    func updateUIViewController(_: UIImagePickerController, context _: Context) {}

    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView

    init(picker: ImagePickerView) {
        self.picker = picker
    }

    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        picker.selectedImage = selectedImage
        picker.isPresented.wrappedValue.dismiss()
    }
}
