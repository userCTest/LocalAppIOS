//
//  PrintData.swift
//  SwiftUI_Implementation
//
//  Created by Rui Reis on 23/02/2023.
//

import Foundation
import Usercentrics
import UsercentricsUI

public func applyResponse(userInteraction: UsercentricsUserInteraction){
    UsercentricsCore.isReady { status in
        let consents  = status.consents
        
        printSectionTitle(title: "USER INTERACION")
        print(userInteraction)
        
        //getGDPRData(consents: consents)
        
        if(UsercentricsCore.shared.getCMPData().activeVariant == UsercentricsVariant.tcf) {
            getTCFData()
        }
        
        if(UsercentricsCore.shared.getCMPData().activeVariant == UsercentricsVariant.ccpa) {
            getCCPAData()
        }

    } onFailure: { error in
        print("\(SDKInitData.LOG_TAG) Error on initialization: \(error.localizedDescription)")
    }
}


fileprivate func printSectionTitle(title: String) {
    
    let str = String(repeating: "-", count: title.count + 12)
    print(str)
    print("----- \(title) -----")
    print(str)
}

fileprivate func getGDPRData(consents: [UsercentricsServiceConsent]) {
//    //CMP Data
//    let data = UsercentricsCore.shared.getCMPData()
//    let categories = data.categories
//    printSectionTitle(title: "CMP DATA")
//    print("Categories: \(categories)")
    
    printSectionTitle(title: "GCPR CONSENTS")
    for consent in consents {
        print("\(String(describing: consent.dataProcessor).padding(toLength: 40, withPad: " ", startingAt: 0)) | TemplateId: \(String(describing: consent.templateId).padding(toLength: 10, withPad: " ", startingAt: 0)) | Consent Status: \(String(describing: consent.status).padding(toLength: 10, withPad: " ", startingAt: 0)) ")
    }
}

fileprivate func getTCFData() {
    // TCF Data
    UsercentricsCore.shared.getTCFData{ tcfData in
        let purposes = tcfData.purposes
        //let specialPurposes = tcfData.specialPurposes
        //let features = tcfData.features
        //let specialFeatures = tcfData.specialFeatures
        //let stacks = tcfData.stacks
        let vendors = tcfData.vendors
        
         //TCString
        printSectionTitle(title: "TCSTRING")
        //let tcString = UsercentricsCore.shared.getTCString()
        let tcString = tcfData.tcString
        print("TCString: \(tcString)")
        
        //print("-- PURPOSES --")
        let purposesList = purposes.sorted(by: { tcfVendor1, tcfVendor2 in
            tcfVendor1.id < tcfVendor2.id })
        
        printSectionTitle(title: "PURPOSES")
        for purpose in purposesList {
            if let consent = purpose.consent {
                if let purposeLIConsent = purpose.legitimateInterestConsent {
                    print("\(String(describing: purpose.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: purpose.id).padding(toLength: 10, withPad: " ", startingAt: 0)) | Consent: \(String(describing: consent.boolValue).padding(toLength: 10, withPad: " ", startingAt: 0)) | LI Value: \(String(describing: purposeLIConsent.boolValue).padding(toLength: 10, withPad: " ", startingAt: 0))")
                }
            }
        }
        
//        printSectionTitle(title: "PURPOSES WITH CONSENT TRUE")
//        let purposesListTrue = purposesList.filter { purpose in purpose.consent == true }
//        for purpose in purposesListTrue {
//        print("\(String(describing: purpose.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: purpose.id).padding(toLength: 10, withPad: " ", startingAt: 0))")
//        }

        printSectionTitle(title: "VENDORS WITH CONSENT TRUE")
        var vendorsList = vendors.filter { tcfVendor in tcfVendor.consent == true }
        vendorsList = vendorsList.sorted(by: { tcfVendor1, tcfVendor2 in
        tcfVendor1.id < tcfVendor2.id })

        for vendor in vendorsList {
            print("\(String(describing: vendor.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0))")
            for purpose in vendor.purposes {
                print("\(String(describing: " ").padding(toLength: 4, withPad: " ", startingAt: 0)) PurposeId: \(String(describing: purpose.id).padding(toLength: 7, withPad: " ", startingAt: 0)) | Purpose Name: \(String(describing: purpose.name).padding(toLength: 20, withPad: " ", startingAt: 0))")
            }
        }

        printSectionTitle(title: "VENDORS WITH LI TRUE")
        var vendorsListLI = vendors.filter { tcfVendor in tcfVendor.legitimateInterestConsent == true }
        vendorsListLI = vendorsList.sorted(by: { tcfVendor1, tcfVendor2 in
        tcfVendor1.id < tcfVendor2.id })

        for vendor in vendorsListLI {
        print("\(String(describing: vendor.name).padding(toLength: 40, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0))")
             if(!vendor.legitimateInterestPurposes.isEmpty){
                 print("-- \(vendor.name) LI Purposes --")
                 for vendor in vendor.legitimateInterestPurposes {
                     print("|$| \(String(describing: vendor.name).padding(toLength: 36, withPad: " ", startingAt: 0)) | Id: \(String(describing: vendor.id).padding(toLength: 7, withPad: " ", startingAt: 0)) |$|")
                 }
             }
        }
    }
}

fileprivate func getCCPAData(){
    // TO DO
}
