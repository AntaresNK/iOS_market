//
//  ConfigureButton.swift
//  iOS_market
//
//  Created by Nazym Sayakhmet on 20.10.2023.
//

import Foundation
import UIKit

extension UIButton {
    func configureButton() {
        self.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        self.layer.cornerRadius = 22
        self.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
