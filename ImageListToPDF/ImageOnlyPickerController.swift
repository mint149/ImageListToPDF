//
//  SampleViewController.swift
//  ImageListToPDF
//
//  Created by hato on 2021/03/22.
//

import Foundation
import UIKit
import SwiftUI
import UniformTypeIdentifiers

struct ImageOnlyPickerController :UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let documentPickerViewController = UIDocumentPickerViewController(
            forOpeningContentTypes: [UTType.image, UTType.pdf],
            asCopy: true
        )
        documentPickerViewController.delegate = context.coordinator

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
            // ファイル選択後に呼ばれる
            // urls.first?.pathExtensionで選択した拡張子が取得できる
            if let filePath = urls.first?.description {
                print("ファイルパス:\(filePath)")
            }
        }
        
        public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            print("キャンセル")
        }
        
    }
}
