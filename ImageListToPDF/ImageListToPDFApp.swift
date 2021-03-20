//
//  ImageListToPDFApp.swift
//  ImageListToPDF
//
//  Created by hato on 2021/03/20.
//

import SwiftUI

@main
struct ImageListToPDFApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("in!")
        print("url: ", url)
        
        // ファイルを扱う処理
        // ...
        
        return true
    }
}
