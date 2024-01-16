//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by hasan bilgin on 1.12.2023.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {
    private var viewModel : RootViewModel!
    private var loginStorageService : MockLoginStorageService!
    private var output : MockRootViewModelOutput!

    override func setUpWithError() throws {
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutput()
        
        viewModel.output = output
    
    }

    override func tearDownWithError() throws {
      viewModel = nil
        loginStorageService = nil
        output = nil
    }

    //showlogin fonksiyonu user boşsa eğer login ekranını açıyormu testi
    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        
        //ikisi birbirine eşitmi
        XCTAssertEqual(output.checkArray.first, .login)
        
    }
    
    //showlogin fonksiyonu user dolu olup token boş döndürüyorsa login ekranını açıcak testi
    func testShowLogin_whenLoginStorageReturnsEmptyString() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        //ikisi birbirine eşitmi
        XCTAssertEqual(output.checkArray.first, .login)
        
    }
    
    //showlogin fonksiyonu user dolu olup token döndürüyorsa main ekranını açıcak testi
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = "sdfaksufmşkl12eşjk"
        viewModel.checkLogin()
        
        //ikisi birbirine eşitmi
        XCTAssertEqual(output.checkArray.first, .mainApp)
    }
}


class MockLoginStorageService : LoginStorageService {
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    //dictionary(sözlük(key : value)) oluşturup boş atadık
    var storage  : [String : String] = [:]
    func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
    
}

class MockRootViewModelOutput : RootViewModelOutput {
    enum Check {
        case login
        case mainApp
    }
    
    //diziyi tanımladı ve boş atadı
    var checkArray : [Check] = []
    
    func showLogin() {
        checkArray.append(.login)
       
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    
}
