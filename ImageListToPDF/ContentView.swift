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
                showSheet = true
            }) {
                Text("Select Files")
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
