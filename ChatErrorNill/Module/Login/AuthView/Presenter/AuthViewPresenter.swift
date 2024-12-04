//
//  AuthViewPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import UIKit
protocol AuthViewPresenterProtocol: AnyObject {
//    init(view: AuthViewProtocol)
    func signIn(userInfo: UserInfo)
}

class AuthViewPresenter: AuthViewPresenterProtocol {
    weak var view: AuthViewProtocol?
   private let authManager = AuthManager()
    private let validator = FieldValidator()
    
    required init(view: AuthViewProtocol) {
        self.view = view
    }
    
    func signIn(userInfo: UserInfo) {
        if validator.isValid(.email, userInfo.email),
           validator.isValid(.password, userInfo.password) {
            authManager.auth(userInfo: userInfo) { result in
                switch result {
                case .success(let success):
                    if success {
                        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.app])
                    }
                   
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
}
