//
//  AuthViewControllerExtension.swift
//  MessengerApp
//
//  Created by Arthur Lee on 16.08.2022.
//

import UIKit

extension AuthViewController: AuthNavigationDelegate {
    func toLogVC() {
        present(loginVC, animated: true, completion: nil)
    }
    
    func toSignUpVC() {
        present(signUpVC, animated: true, completion: nil)
    }
}
