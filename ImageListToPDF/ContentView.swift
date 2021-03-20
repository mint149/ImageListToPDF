//
//  ContentView.swift
//  pdfTest
//
//  Created by hato on 2021/03/18.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    var body: some View {
        Button(action: {
            let pdf = PDFDocument()
            pdf.insert(ImagePage(imageName: "testShot"), at: pdf.pageCount)
            pdf.insert(ImagePage(imageName: "testShot2"), at: pdf.pageCount)

            if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let path = url.appendingPathComponent("output.pdf")
                print(path)
                pdf.write(to: path)
            }
        }) {
            Text("Go!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
