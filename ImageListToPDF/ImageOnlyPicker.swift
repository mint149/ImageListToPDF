//
//  ImageOnlyPicker.swift
//  ImageListToPDF
//
//  Created by hato on 2021/03/23.
//

import SwiftUI

struct ImageOnlyPicker: View {
    @Binding var pdfName: String
    var body: some View {
        ImageOnlyPickerController(pdfName: $pdfName)
    }
}

struct ImageOnlyPicker_Previews: PreviewProvider {
    static var previews: some View {
        ImageOnlyPicker(pdfName: .constant("testPDF"))
    }
}
