//
//  RegVieew.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit
protocol RegViewProtocol: AnyObject {
    
}

class RegView: UIViewController, RegViewProtocol {
    var presenter: RegViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = .localize("regTitleLabel")
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 26, weight: .black)
        return $0
    }(UILabel())
    lazy var nameField = TextField(fieldPlaceholder: .localize("namePlaceholder"))
    lazy var emailField: UITextField = TextField(fieldPlaceholder: "Email")
    lazy var passwordField: UITextField = TextField(fieldPlaceholder: .localize("passwordPlaceholder"), isPassword: true)
    lazy var regButton = Button(buttonText: .localize("regButton")) {
        print("Reg")
    }
    lazy var bottomButton = Button(buttonText: .localize("regButton1"), buttonColor: .clear, textColor: .white) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.auth])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(pageTitle, nameField, emailField, passwordField, regButton, bottomButton)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            nameField.heightAnchor.constraint(equalToConstant: 50),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameField.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 40),
            
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 40),
            
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 40),
            
            
            regButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            regButton.heightAnchor.constraint(equalToConstant: 50),
            regButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            regButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButton.topAnchor.constraint(equalTo: regButton.bottomAnchor, constant: 40),
            bottomButton.heightAnchor.constraint(equalToConstant: 50),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
