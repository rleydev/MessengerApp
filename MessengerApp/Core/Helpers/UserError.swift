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
    case canNotGetUserInfo
    case canNotUnwrapToMUser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill the data", comment: "")
        case .photoNotExist:
            return NSLocalizedString("The wrong photo format", comment: "")
        case .canNotGetUserInfo:
            return NSLocalizedString("Impossible to load user information", comment: "")
        case .canNotUnwrapToMUser:
            return NSLocalizedString("Impossible to convert MUser into User", comment: "")
        }
    
    }
}
    
