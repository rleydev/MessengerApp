//
//  AuthError.swift
//  MessengerApp
//
//  Created by Arthur Lee on 11.08.2022.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordNotMatched
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill the data", comment: "")
        case .invalidEmail:
            return NSLocalizedString("The wrong email format", comment: "")
        case .passwordNotMatched:
            return NSLocalizedString("Passwords are different", comment: "")
        case .serverError:
            return NSLocalizedString("Server Error", comment: "")
        }
    }
}
