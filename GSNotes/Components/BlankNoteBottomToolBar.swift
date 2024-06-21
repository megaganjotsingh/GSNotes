//
//  BlankNoteBottomToolBar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

class SharedVar: ObservableObject {
    @Published var isChecklistPressed = false
    @Published var isCanvasPressed = false
    @Published var isNewNotePressed = false

    func toggleChecklist() {
        isChecklistPressed.toggle()
    }

    func toggleCanvas() {
        isCanvasPressed.toggle()
    }

    func toggleNewNote() {
        isNewNotePressed.toggle()
    }
}

struct BlankNoteBottomToolBar: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @ObservedObject var sharedVar: SharedVar

    @Binding var text: String

    var body: some View {
        HStack {
            Button(action: {
                sharedVar.toggleChecklist()
            }) {
                Image(systemName: "checklist")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

            Spacer()

            Menu {
                Button {
                    self.sourceType = .photoLibrary
                    self.isShowPhotoLibrary = true
                } label: {
                    Label("Choose Photo or Video", systemImage: "photo.on.rectangle")
                }

                Button {
                    self.isShowCamera = true
                } label: {
                    Label("Scan Documents", systemImage: "doc.viewfinder")
                }

                Button {
                    self.sourceType = .camera
                    self.isShowCamera = true
                } label: {
                    Label("Take Photo or Video", systemImage: "camera")
                }.padding()

                Button {
                    self.isShowCamera = true
                } label: {
                    Label("Scan Text", systemImage: "text.viewfinder")
                }
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)

            }.sheet(isPresented: self.$isShowPhotoLibrary) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: .photoLibrary)
            }
            .sheet(isPresented: self.$isShowCamera) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: .camera)
            }

            Spacer()

            Button(action: {
                sharedVar.toggleCanvas()
            }) {
                Image(systemName: "pencil.tip.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()

            Spacer()

            Button(action: {
                clearText()
                sharedVar.toggleNewNote()
            }) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
        }
    }

    private func clearText() {
        text = ""
    }
}
