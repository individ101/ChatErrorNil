//
//  AuthView.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import UIKit
import Foundation

protocol AuthViewProtocol: AnyObject {
    
}

class AuthView: UIViewController, AuthViewProtocol {
    var presenter: AuthViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = .localize("authTitleLabel")
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 26, weight: .black)
        return $0
    }(UILabel())
    
    lazy var emailField: UITextField = TextField(fieldPlaceholder: "Email")
    lazy var passwordField: UITextField = TextField(fieldPlaceholder: .localize("passwordPlaceholder"), isPassword: true)
    
    lazy var authButton = Button(buttonText: .localize("authButton")) { [ weak self ] in
        guard let self = self else { return }
        
        let userInfo = UserInfo(email: emailField.text ?? "", password: passwordField.text ?? "")
        presenter.signIn(userInfo: userInfo)
    }
    
    lazy var bottomButton = Button(buttonText: .localize("regButton"), buttonColor: .clear, textColor: .white) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.reg])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(pageTitle, emailField, passwordField, authButton, bottomButton)
        setConstraints()
    }
    
   private func setConstraints() {
       NSLayoutConstraint.activate([
        pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        pageTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        
        emailField.heightAnchor.constraint(equalToConstant: 50),
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
        
        passwordField.heightAnchor.constraint(equalToConstant: 50),
        passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
        
        
        authButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
        authButton.heightAnchor.constraint(equalToConstant: 50),
        authButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        authButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        
        bottomButton.topAnchor.constraint(equalTo: authButton.bottomAnchor, constant: 20),
        bottomButton.heightAnchor.constraint(equalToConstant: 50),
        bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
       ])
    }
}
