//
//  ViewController.swift
//  LoginProtocolOriented
//
//  Created by hasan bilgin on 1.12.2023.
//

import UIKit

//ilk ekran
class RootViewController: UIViewController , RootViewModelOutput {

    private let viewModel : RootViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        //kullanıyoruz
        viewModel.checkLogin()
    }
    
    //RootViewModel init ekledik
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        //kendimizde artıkın RootViewModelOutput zdur
        viewModel.output = self
    }
    
    //viewModel ile geldi
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func checkLogin() {
//        //bu kullanım endüstride kullanılmaz olanlarıda vardır
//        //UserDefaults da bu key ile veri varmı ve o veri boş değilse anlamındadır
//        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
//            showMainApp()
//        } else {
//            showLogin()
//        }
//    }
//    
//    func showMainApp() {
//        let mainViewController = MainViewController()
//        navigationController?.present(mainViewController, animated: true)
//    }
//    
//    func showLogin() {
//        let loginViewController = LoginViewController()
//        navigationController?.present(loginViewController, animated: true)
//    }

    
    
        func showMainApp() {
            let mainViewController = MainViewController()
            navigationController?.present(mainViewController, animated: true)
        }
    
        func showLogin() {
            let loginViewController = LoginViewController()
            navigationController?.present(loginViewController, animated: true)
        }
    
        
}

