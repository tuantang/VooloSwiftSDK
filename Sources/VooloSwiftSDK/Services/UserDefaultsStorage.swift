//
//  UserDefaultsStorage.swift
//  
//
//  Created by Tuan Tang on 01/04/2022.
//

import Foundation

struct UserDefaultsStorage {
    static let userDefaultSDK = "VooloSDK"
    static let loggedInToken = "VooloSDK_logged_token"
    
    static let appUserDefault = UserDefaults(suiteName: userDefaultSDK) ?? UserDefaults.standard
    
    static func storeToken(_ token: String) {
        appUserDefault.set(token, forKey: loggedInToken)
    }
    
    static func getToken() -> String? {
        return appUserDefault.object(forKey:loggedInToken) as? String
    }
}
