//
//  ContentView.swift
//  LocalApp
//
//  Created by Rui Reis on 08/03/2023.
//

import SwiftUI
import Usercentrics
import UsercentricsUI

struct ContentView: View {
    init() {
        UsercentricsUIViewController().showFirstLayer(layout: .sheet)
    }
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some View {
        VStack {
            Image("usercentrics")
                .imageScale(.large)
                .padding(30)
                .frame(width: 200, height: 70)
            
            Spacer()
            VStack{
                Button("Full CMP"){
                    UsercentricsUIViewController().showFirstLayer(layout: .full)
                }
                .frame(width: 250, height: 35)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("Full CMP")
                
                Button("First Layer Bottom"){
                    UsercentricsUIViewController().showFirstLayer(layout: .popup(position: .bottom))
                }
                .frame(width: 250, height: 35)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("First Layer Bottom")
                
                Button("First Layer Center"){
                    UsercentricsUIViewController().showFirstLayer(layout: .popup(position: .center))
                }
                .frame(width: 250, height: 35)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("First Layer Center")
                
                Button("First Layer Sheet"){
                    UsercentricsUIViewController().showFirstLayer(layout: .sheet)
                }
                .frame(width: 250, height: 35)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("First Layer Sheet")
                
                
                Button("Second Layer"){
                    UsercentricsUIViewController().showSecondLayer()
                }
                .frame(width: 250, height: 35)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("Second Layer")
                
                Spacer()
                
                Button("Reset CMP"){
                    UsercentricsUIViewController().reset()
                }
                .frame(width: 250, height: 35)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("Reset CMP")
                
                Spacer()
                
                Button("Open WebView"){
                    restoreUserSession(url: "https://app.usercentrics.eu/browser-ui/preview/index.html?settingsId=\(SDKInitData.settingsId)")
                }
                .frame(width: 250, height: 40)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                .accessibilityIdentifier("Open WebView")
                
            }
            .padding(50)
        }
        .padding(20)
        Spacer()
        UsercentricsUIViewController()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
