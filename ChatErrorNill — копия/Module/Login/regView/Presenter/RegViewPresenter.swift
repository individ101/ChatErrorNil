//
//  RegViewPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit
protocol RegViewPresenterProtocol: AnyObject {
    init(view: RegViewProtocol)
}

class RegViewPresenter: RegViewPresenterProtocol {
    weak var view: RegViewProtocol?
    required init(view: RegViewProtocol) {
        self.view = view
    }
    
    
}
