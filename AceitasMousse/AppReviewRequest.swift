//
//  AppReviewRequest.swift
//  AceitasMousse
//
//  Created by Elaine  Cruz on 10/03/21.
//

import SwiftUI
import StoreKit

enum AppReviewRequest{
    static var requestAllowed = true
    @AppStorage("version") static var version = ""
     
    static func requestReviewIfNeeded(){
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

        if(version != appVersion){
            requestAllowed = true
            version = appVersion
        }
        if(requestAllowed){
            if let windowScene = UIApplication.shared.connectedScenes.first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: windowScene)
                }
            requestAllowed = false
        }
        
    }
}
