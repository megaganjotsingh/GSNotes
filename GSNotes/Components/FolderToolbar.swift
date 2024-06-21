//
//  FolderToolbar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import Foundation
import SwiftUI

struct FolderToolbar: View {
    @ObservedObject var noteList: NoteList
    var action: () -> Void

    init(noteList: NoteList, action: @escaping () -> Void) {
        self.noteList = noteList
        self.action = action
    }

    var body: some View {
        HStack {
            Button { action() } label: {
                Image(systemName: "folder.badge.plus")
            }

            Spacer()

            NavigationLink(destination: BlankNoteView(note: noteList, chosenNoteId: -1)) {
                Image(systemName: "square.and.pencil")
            }
        }
    }
}
