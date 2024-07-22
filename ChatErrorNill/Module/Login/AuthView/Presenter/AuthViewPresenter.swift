//
//  AuthViewPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import UIKit
protocol AuthViewPresenterProtocol: AnyObject {
    init(view: AuthViewProtocol)
}

class AuthViewPresenter: AuthViewPresenterProtocol {
    weak var view: AuthViewProtocol?
    required init(view: AuthViewProtocol) {
        self.view = view
    }
    
    
}
