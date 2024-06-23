//
//  BlankNoteTopToolBar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

struct BlankNoteTopToolBar: View {
    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                // Perform action for the share button
                presentShareActivity()
            }) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            }

            Menu {
                Button {
                    print("Test")
                } label: {
                    Image(systemName: "magnifyingglass")
                    Text("Find in Note")
                }
                Button {
                    print("Test")
                } label: {
                    Image(systemName: "folder")
                    Text("Move Note")
                }
                Button {
                    print("Test")
                } label: {
                    Image(systemName: "squareshape.split.3x3")
                    Text("Lines & Grids")
                }
                Button {
                    print("Test")
                } label: {
                    Image(systemName: "circle.righthalf.filled")
                    Text("Use Light Background")
                }
                Button(role: .destructive) {
                    print("Test")
                } label: {
                    Image(systemName: "trash")
                    Text("Delete")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            }
            .padding(.leading)
        }
    }

    func presentShareActivity() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first
        else {
            return
        }

        let shareSheet = UIActivityViewController(activityItems: ["Sharing content"], applicationActivities: nil)
        window.rootViewController?.present(shareSheet, animated: true, completion: nil)
    }
}

#Preview {
    BlankNoteTopToolBar()
}
