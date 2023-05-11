//
//  ContentView.swift
//  TVTest
//
//  Created by Rui Reis on 11/05/2023.
//
import SwiftUI
import Usercentrics

struct ContentView: View {
    
    init() {
        let options = UsercentricsOptions(settingsId: SDKInitData.settingsId)
        UsercentricsCore.configure(options: options)
        print("Usercentrics initialized")
        UsercentricsCore.isReady { it in
            print(it.consents)
        } onFailure: { error in
            print("[Usercentrics][Error]: \(error)")
        }
    }
    
    var body: some View {
        VStack {
            Image("usercentrics")
                .imageScale(.large)
                .padding(30)
                .frame(width: 200, height: 100)
                .cornerRadius(10)
            
            Spacer()
            VStack{
                Button("Show First Layer"){
                    UsercentricsUIViewController().showFirstLayer()
                }
                .frame(width: 400, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
                
                Button("Show Second Layer"){
                    UsercentricsUIViewController().showSecondLayer()
                }
                .frame(width: 400, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(5)
                .padding(5)
            }
            .padding(100)
        }
        .padding(50)
        Spacer()
        UsercentricsUIViewController()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
