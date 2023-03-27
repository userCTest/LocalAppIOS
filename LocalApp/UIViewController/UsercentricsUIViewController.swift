//
//  UsercentricsUIViewController.swift
//  CMPTest
//
//  Created by Rui Reis on 03/10/2022.
//

import Foundation
import SwiftUI
import Usercentrics
import UsercentricsUI

struct UsercentricsUIViewController: UIViewControllerRepresentable {
    // Show first layer at start of view
    
    typealias UIViewControllerType = UIViewController
    
    let view = UIViewController()
    
    // Two stubs for implementation of UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> UIViewController {
                        
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // TODO
    }
    
    func showFirstLayer(layout: UsercentricsLayout) {
        
        UsercentricsCore.isReady { status in
            let banner = UsercentricsBanner(bannerSettings: getBannerSettings(layout: layout))
            let newView = getTopMostViewController() ?? view
            
            banner.showFirstLayer(hostView: newView) { userResponse in
                applyResponse(userInteraction: userResponse.userInteraction)
            }
        } onFailure: { error in
            print("\(SDKInitData.LOG_TAG) SDK not yet ready")
        }
    }
    
    func showSecondLayer() {
        
        UsercentricsCore.isReady { status in
            
            let banner = UsercentricsBanner(bannerSettings: getBannerSettings(layout: nil))
            
            let newView = getTopMostViewController() ?? view

            banner.showSecondLayer(hostView: newView) { userResponse in
                applyResponse(userInteraction: userResponse.userInteraction)
            }
        } onFailure: { error in
            print("\(SDKInitData.LOG_TAG) SDK not yet ready")
        }
    }
    
    func reset(){
        print("\(SDKInitData.LOG_TAG) SDK Resetting...")
        UsercentricsCore.reset()
        sdkInit()
    }
}
