//
//  UILabel+Extension.swift
//  MessengerApp
//
//  Created by Arthur Lee on 09.08.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
