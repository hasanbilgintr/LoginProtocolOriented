//
//  LoginStorageService.swift
//  LoginProtocolOriented
//
//  Created by hasan bilgin on 1.12.2023.
//

import Foundation

protocol LoginStorageService {
    //ACCESS_TOKEN yerini alcak
    var userAccessTokenKey : String {get}
    func setUserAccessToken(token : String)
    //opsinal olması girilmemişte olabilir diuye
    func getUserAccessToken() -> String?
}
