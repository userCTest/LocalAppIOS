//
//  UsercentricsUIViewController.swift
//  TVTest
//
//  Created by Rui Reis on 11/05/2023.
//

import Foundation
import SwiftUI
import Usercentrics
import UsercentricsUI

struct UsercentricsUIViewController: UIViewControllerRepresentable {
    let LOG_TAG = "[USERCENTRICS][ERROR]: "
    
    typealias UIViewControllerType = UIViewController
    
    let view = UIViewController()
    
    // Two stubs for implementation of UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> UIViewController {
                        
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // TODO
    }
    
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
    
    func showFirstLayer() {
        
        UsercentricsCore.isReady { status in
            let banner = UsercentricsBanner()
            let newView = getTopMostViewController() ?? view
            
            banner.showFirstLayer(hostView: newView) { userResponse in
                print("Consents: \(userResponse)")
            }
        } onFailure: { error in
            print("SDK not yet ready")
        }
    }
    
    func showSecondLayer() {
        
        UsercentricsCore.isReady { status in
            
            let banner = UsercentricsBanner()
            
            let newView = getTopMostViewController() ?? view

            banner.showSecondLayer(hostView: newView) { userResponse in
                print("Consents: \(userResponse)")
                
                UsercentricsCore.shared.getTCFData() { tcfData in
                    let tcString = tcfData.tcString
                    print("TCSTRING: \(tcString)")
                }
            }
        } onFailure: { error in
            print("SDK not yet ready")
        }
    }
}

