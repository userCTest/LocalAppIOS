//
//  TopViewController.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 23/02/2023.
//

import Foundation
import UIKit

// Getting top most view for showLayer API calls
func getTopMostViewController() -> UIViewController? {
    let scenes = UIApplication.shared.connectedScenes
    let windowScene = scenes.first as? UIWindowScene
    guard let window = windowScene?.windows.first else { return nil }
    var topMostViewController = window.rootViewController
    while let presentedViewController = topMostViewController?.presentedViewController {
        topMostViewController = presentedViewController
    }

    return topMostViewController
}
