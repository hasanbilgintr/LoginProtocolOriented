//
//  LoginStorageServiceImpl.swift
//  LoginProtocolOriented
//
//  Created by hasan bilgin on 1.12.2023.
//

import Foundation

//Impl  -> Implementation (kısaltılması)
//APIManager gibi düşünebilirsiniz
class LoginStorageServiceImpl : LoginStorageService {
    
    private let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.set(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessTokenKey)
    }
    
    
}
