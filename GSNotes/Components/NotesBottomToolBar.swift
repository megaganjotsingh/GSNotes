//
//  NotesBottomToolBar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

struct NotesBottomToolBar: View {
    
    @ObservedObject var noteList: NoteList
    var notesNumber: String

    init(noteList: NoteList, notesNumber: String) {
        self.noteList = noteList
        self.notesNumber = notesNumber
    }

    var body: some View {
        Spacer()

        Text(notesNumber)
            .font(.system(size: 14))

        Spacer()

        NavigationLink(destination: BlankNoteView(note: noteList, chosenNoteId: -1)) {
            Image(systemName: "square.and.pencil")
        }
    }
}
