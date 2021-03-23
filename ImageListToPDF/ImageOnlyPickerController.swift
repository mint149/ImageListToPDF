//
//  SampleViewController.swift
//  ImageListToPDF
//
//  Created by hato on 2021/03/22.
//

import Foundation
import UIKit
import SwiftUI
import PDFKit
import UniformTypeIdentifiers

struct ImageOnlyPickerController :UIViewControllerRepresentable{
    @Binding var pdfName: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let documentPickerViewController = UIDocumentPickerViewController(
            forOpeningContentTypes: [UTType.image],
            asCopy: true
        )
        documentPickerViewController.delegate = context.coordinator
        documentPickerViewController.allowsMultipleSelection = true

        return documentPickerViewController
    }
    
    func updateUIViewController(_ documentPickerViewController: UIViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: ImageOnlyPickerController
        
        init(_ parent: ImageOnlyPickerController) {
            self.parent = parent
        }
        
        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if urls.first == nil {
                return
            }
            
            if parent.pdfName == "" {
                parent.pdfName = "output"
            }
            
            let sortedUrls = urls.sorted(by: { (a, b) -> Bool in
                return a.pathComponents.last! < b.pathComponents.last!
            })
            
            let pdf = PDFDocument()

            sortedUrls.forEach { (url) in
                url.startAccessingSecurityScopedResource()
                
                print("description:\(url.description)")
                print("pathExtension:\(url.pathExtension)")
                print("pathComponents:\(url.pathComponents)")

                let image:UIImage = UIImage(url: url)

                pdf.insert(ImagePage(image: image), at: pdf.pageCount)

                url.stopAccessingSecurityScopedResource()
            }

            if let outputUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let path = outputUrl.appendingPathComponent("\(parent.pdfName).pdf")
                print(path)
                pdf.write(to: path)
            }
        }
        
        public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            print("キャンセル")
        }
    }
}

