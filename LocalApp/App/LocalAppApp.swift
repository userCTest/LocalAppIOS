//
//  LocalAppApp.swift
//  LocalApp
//
//  Created by Rui Reis on 08/03/2023.
//

import SwiftUI

@main
struct LocalAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
