//
//  WhiteButton.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import UIKit

class Button: UIButton {
    var buttonText: String
    var completion: () -> ()
    var buttonColor: UIColor
    var textColor: UIColor
    
    init(buttonText: String, buttonColor: UIColor = .white, textColor: UIColor = .black, completion: @escaping () -> Void) {
        self.buttonText = buttonText
        self.completion = completion
        self.buttonColor = buttonColor
        self.textColor = textColor
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupButton()
    }
    
    func setupButton() {
        addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            completion()
        }), for: .touchUpInside)
        setTitle(buttonText, for: .normal)
        backgroundColor = buttonColor
        setTitleColor(textColor, for: .normal)
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
