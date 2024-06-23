//
//  SearchBarButton.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import SwiftUI

struct SearchBarButton: View {
    
    var body: some View {
        NavigationLink(destination: SearchView()) {
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.gray)
            .padding(.vertical, 6)
            .padding(.horizontal, 6)
            .background(Color.gray.opacity(0.15).cornerRadius(10))
        }
    }
}

struct SearchBarButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarButton()
    }
}
