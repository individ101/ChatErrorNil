//
//  UIView+Extensions.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
