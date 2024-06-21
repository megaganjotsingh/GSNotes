//
//  SearchTopToolBar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

struct SearchTopToolBar: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var text: String
    @Binding var showFilteredResults: Bool

    var body: some View {
        VStack {
            HStack {
                SearchBar(text: $text, showFilteredResults: $showFilteredResults)
                    .padding(.leading, 10)
                    .padding(.trailing, -10)

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                .padding()
            }
        }
    }
}
