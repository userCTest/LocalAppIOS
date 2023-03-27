//
//  BannerSettings.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 23/02/2023.
//

import Foundation
import UsercentricsUI
import UIKit

func getBannerSettings(layout: UsercentricsLayout?) -> BannerSettings {
    var bannerSettings = BannerSettings()
    
    // Layer Style definitions
    let toggleStyleSettings = ToggleStyleSettings(
        activeBackgroundColor: UIColor.green,
         inactiveBackgroundColor: UIColor.cyan,
         disabledBackgroundColor: UIColor.magenta,
         activeThumbColor: UIColor.blue,
         inactiveThumbColor: UIColor.brown,
         disabledThumbColor: UIColor.systemPink
    )

    let generalStyleSettings = GeneralStyleSettings(
        font: BannerFont(
            regularFont:  UIFont(name: "Avenir", size: 15)!,
            boldFont: UIFont(name: "Avenir-Heavy", size: 15)!
        ),
        logo: UIImage(named: "hat-head-king-svgrepo-com"),
        links: .firstLayerOnly,
        textColor: UIColor.magenta,
        layerBackgroundColor: UIColor.black,
        layerBackgroundSecondaryColor: UIColor.black,
        linkColor: UIColor.green,
        tabColor: UIColor.red,
        bordersColor: UIColor.darkGray,
        toggleStyleSettings: toggleStyleSettings
    )


    let firstLayerSettings = FirstLayerStyleSettings(
        layout: layout,
        headerImage: nil,
        title: nil, //getTitleSettings(),
        message: nil, //getMessageSettings(),
        buttonLayout: nil, //getButtonLayout(),
        backgroundColor: nil, //UIColor(red: 218, green: 218, blue: 218, alpha: 1.0),
        cornerRadius: 20
    )

    let secondLayerSettings = SecondLayerStyleSettings(
        //buttonLayout: ButtonLayout.column(),
        showCloseButton: true
    )
    
    if(layout != nil) {
        bannerSettings = BannerSettings(
            generalStyleSettings: GeneralStyleSettings(),
            firstLayerStyleSettings: firstLayerSettings,
            secondLayerStyleSettings: secondLayerSettings
        )
    }
    
    return bannerSettings
}

func getTitleSettings() -> TitleSettings {
    return TitleSettings(font: UIFont(name: "Avenir", size: 25), textColor: .black, textAlignment: .left)
}


func getMessageSettings() -> MessageSettings {
    return MessageSettings(font: UIFont(name: "Avenir", size: 15), textColor: .black, textAlignment: .left, linkTextColor: .blue)
}

func getButtonLayout() -> ButtonLayout {
    let acceptButton = ButtonSettings(type: .acceptAll, font: UIFont(name: "Avenir", size: 12), cornerRadius: 18)
    let denyButton = ButtonSettings(type: .denyAll, font: UIFont(name: "Avenir", size: 12), cornerRadius: 18)
    let moreButton = ButtonSettings(type: .more, font: UIFont(name: "Avenir", size: 12), textColor: .black, backgroundColor: .orange, cornerRadius: 18)
    
    return ButtonLayout.row(buttons: [acceptButton, denyButton, moreButton])
}
