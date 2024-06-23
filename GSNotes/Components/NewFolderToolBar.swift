//
//  NewFolderToolBar.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import Foundation
import SwiftUI

struct NewFolderToolbar: View {
    
    let okAction: () -> Void
    let cancelAction: () -> Void

    var body: some View {
        HStack {
            Button { cancelAction() } label: {
                Text("Cancel")
                    .foregroundColor(.yellow)
            }

            Spacer()
            Text("New Folder").fontWeight(.semibold)
            Spacer()

            Button { okAction() } label: {
                Text("Done").fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
        }
    }
}
