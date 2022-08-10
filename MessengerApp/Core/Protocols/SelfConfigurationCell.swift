//
//  SelfConfigurationCell.swift
//  MessengerApp
//
//  Created by Arthur Lee on 10.08.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}

