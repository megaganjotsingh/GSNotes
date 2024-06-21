//
//  CanvasView.swift
//  GSNotes
//
//  Created by Gaganjot Singh on 29/05/24.
//

import PencilKit
import SwiftUI

struct MyCanvas: UIViewRepresentable {
    var canvasView: PKCanvasView
    let picker = PKToolPicker()

    func makeUIView(context _: Context) -> PKCanvasView {
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        canvasView.becomeFirstResponder()
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context _: Context) {
        picker.addObserver(canvasView)
        picker.setVisible(true, forFirstResponder: uiView)
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
        }
    }
}
