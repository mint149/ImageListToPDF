//
//  ContentView.swift
//  pdfTest
//
//  Created by hato on 2021/03/18.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    @State var showSheet = false
    @State var pdfName = ""

    var body: some View {
        VStack{
            TextField("Input PDF Name", text: $pdfName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
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
            Button(action: {
                showSheet = true
            }) {
                Text("Show Picker")
            }
            .sheet(isPresented: $showSheet, content: {
                ImageOnlyPicker(pdfName: $pdfName)
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
