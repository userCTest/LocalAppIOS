//
//  AppDelegate.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/11/2022.
//

import Foundation
import Usercentrics
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        sdkInit()
        
        // MARK: Mediation
        // Firebase
        FirebaseApp.configure()
        
        return true
    }
}

