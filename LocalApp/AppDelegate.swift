//
//  AppDelegate.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 25/11/2022.
//

import Foundation
import Usercentrics
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        sdkInit()
        
        return true
    }
}
