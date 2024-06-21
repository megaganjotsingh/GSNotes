//
//  NotesView.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var noteList: NoteList
    var title: String

    init(noteList: NoteList, title: String) {
        self.noteList = noteList
        self.title = title
    }
    
    var notesBottomTitle: String {
        let notesCount = noteList.noteList.count
        
        return notesCount == 0 ? "No Note" : notesCount > 1 ? "\(notesCount) notes" : "1 note"
    }

    var body: some View {
        VStack {
            SearchBarButton()
                .padding(.top, -15)

            if !noteList.noteList.isEmpty {
                List {
                    if !getNotesCreatedToday(notes: noteList.noteList).isEmpty {
                        createSection(header: "Today", notes: getNotesCreatedToday(notes: noteList.noteList))
                    }
                    if !getNotesCreatedWithinLast15Days(notes: noteList.noteList).isEmpty {
                        createSection(header: "Previous days", notes: getNotesCreatedWithinLast15Days(notes: noteList.noteList))
                    }
                }
                .padding(.horizontal, -20)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(title)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NotesTopToolBar()
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                NotesBottomToolBar(noteList: noteList, notesNumber: notesBottomTitle)
            }
        }
        .background(Color.clear.opacity(0.3))
    }

    func createSection(header: String, notes: [Note]) -> some View {
        Section(header: SectionHeaderView(text: header, capitalization: .none)) {
            ForEach(notes) { note in
                NavigationLink(destination: BlankNoteView(note: noteList, chosenNoteId: note.id)) {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)

                        HStack {
                            Text(note.time)

                            let secondChar = note.description.dropFirst().first

                            if secondChar == "." {
                                Text(note.description.dropFirst().dropFirst())
                            } else {
                                Text(note.description)
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct SectionHeaderView: View {
    let text: String
    let capitalization: Text.Case?

    var body: some View {
        Text(text)
            .font(.title3.bold())
            .foregroundColor(Color(uiColor: UIColor.label))
            .textCase(capitalization)
            .alignmentGuide(.leading) { _ in 0 }
            .padding(.vertical, 5)
    }
}

func getNotesCreatedToday(notes: [Note]) -> [Note] {
    let today = Calendar.current.startOfDay(for: Date())

    return notes.filter { note in
        let noteDate = Calendar.current.startOfDay(for: note.date)
        return noteDate == today
    }
}

func getNotesCreatedWithinLast15Days(notes: [Note]) -> [Note] {
    let today = Calendar.current.startOfDay(for: Date())
    let fifteenDaysAgo = Calendar.current.date(byAdding: .day, value: -15, to: today)!

    return notes.filter { note in
        let noteDate = Calendar.current.startOfDay(for: note.date)
        return noteDate >= fifteenDaysAgo && noteDate < today
    }
}
