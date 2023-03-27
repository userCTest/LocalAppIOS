//
//  Init.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 24/02/2023.
//

import Foundation
import Usercentrics

func sdkInit(){
    let options = UsercentricsOptions(settingsId: SDKInitData.settingsId)
    UsercentricsCore.configure(options: options)
    print("\(SDKInitData.LOG_TAG) Usercentrics initialized")
    
    shouldCollectConsent()
}

func shouldCollectConsent(){
    UsercentricsCore.isReady { status in
        print("\(SDKInitData.LOG_TAG) Should Collect Consent: \(status.shouldCollectConsent)")
    } onFailure: { error in
        print("\(SDKInitData.LOG_TAG): SDK not ready - Error: \(error.localizedDescription).")
    }
}
