/*
 bu ekran kullanıcı en son kullanıcı giriş yapılı ise main değilse login ekranı açılcak
 */

import Foundation


class RootViewModel {
    
    private let loginStorageService : LoginStorageService
    
    weak var output : RootViewModelOutput?
    
    //outputu çıkardık zaten ekliydi
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
        
    }
    
    func checkLogin() {
        
      
        
        //bu kullanım endüstride kullanılmaz olanlarıda vardır
        //UserDefaults da bu key ile veri varmı ve o veri boş değilse anlamındadır
//        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
        if let accessToken = loginStorageService.getUserAccessToken(), !accessToken.isEmpty {
//            showMainApp()
            output?.showMainApp()
        } else {
//            showLogin()
            output?.showLogin()
        }
    }
}
