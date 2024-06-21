//
//  Array+Extension.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 21/06/24.
//

import Foundation

extension Array {
    func getElement(at index: Int) -> Element? {
        self.count > index ? self[index] : nil
    }
}
