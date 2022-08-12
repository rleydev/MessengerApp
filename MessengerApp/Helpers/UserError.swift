//
//  UserError.swift
//  MessengerApp
//
//  Created by Arthur Lee on 11.08.2022.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill the data", comment: "")
        case .photoNotExist:
            return NSLocalizedString("The wrong photo format", comment: "")
        }
    }
}
    
