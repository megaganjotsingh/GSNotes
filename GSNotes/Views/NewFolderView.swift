//
//  NewFolderView.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import Foundation
import SwiftUI

struct NewFolderView: View {
    
    @ObservedObject var folderList: FolderList
    @Environment(\.dismiss) var dismiss
    @State private var text: String = "New folder"

    init(folderList: FolderList) {
        self.folderList = folderList
        UITextField.appearance().clearButtonMode = .always
    }

    var body: some View {
        VStack {
            HStack {
                NewFolderToolbar(
                    okAction: {
                        folderList.data.append(Folder(
                            id: folderList.data.count + 1,
                            title: text,
                            icon: "folder",
                            quantity: 0,
                            notes: NoteList(noteList: [])
                        ))
                        dismiss()

                    },
                    cancelAction: { dismiss() }
                )
            }
            .padding(.bottom)
            HStack {
                TextField("", text: $text)
                    .onSubmit {
                        folderList.data.append(Folder(
                            id: folderList.data.count + 1,
                            title: text,
                            icon: "folder",
                            quantity: 0,
                            notes: NoteList(noteList: [])
                        ))
                        dismiss()
                    }

            }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
                .background(Color(.systemGray5))
                .frame(height: 44)
                .cornerRadius(12)
                .accentColor(.yellow)

            Spacer()
        }
        .padding()
    }
}
