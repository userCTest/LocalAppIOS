//
//  WebviewUtils.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 23/02/2023.
//

import Foundation
import SwiftUI
import Usercentrics
import UsercentricsUI
import WebKit

func restoreUserSession(url: String) {
    let view = getTopMostViewController()
    
    var myWebView: WKWebView
    let sessionData = UsercentricsCore.shared.getUserSessionData()
    
    let script = """
        window.UC_UI_USER_SESSION_DATA = \(sessionData);
    """
    
    let log = """
        console.log(window.UC_UI_USER_SESSION_DATA);
    """
    
    let userScript = WKUserScript(source: script, injectionTime: .atDocumentStart, forMainFrameOnly: true)
    let logScript = WKUserScript(source: log, injectionTime: .atDocumentStart, forMainFrameOnly: true)
    let contentController = WKUserContentController()
    contentController.addUserScript(userScript)
    contentController.addUserScript(logScript)
    
    print("Open Webview Button Tapped")
    let webConfiguration = WKWebViewConfiguration()
    webConfiguration.defaultWebpagePreferences.allowsContentJavaScript = true
    webConfiguration.userContentController = contentController
    myWebView = WKWebView(frame: .zero, configuration: webConfiguration)
    
    //webView.configuration.preferences.javaScriptEnabled = true
    //myWebView.uiDelegate = self
    
    myWebView.frame = view!.view.bounds
    myWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view!.view.addSubview(myWebView)
    
    let myUrl = URL(string: url)
    if myUrl == nil {
        print("\(SDKInitData.LOG_ERROR_TAG) URL provided is not properly formatted.")
        
    }
    
    let myRequest = URLRequest(url: myUrl!)
    myWebView.load(myRequest)
}
