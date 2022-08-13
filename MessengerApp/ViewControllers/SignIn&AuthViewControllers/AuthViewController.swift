//
//  AuthViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 09.08.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let signUpVC = SignUpViewController()
    private let loginVC = LoginViewController()
    
    private let messangerDescriptionLabel = UILabel(text: "Get started with")
    
    private let emailLabel = UILabel(text: "Sign Up with")
    
    private let alreadyOnboardedLabel = UILabel(text: "Already onboared")
    
    private let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    
    private let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadowed: true)
    
    private let messengerAppInfo = UIButton(title: "Messenger App", titleColor: .black, backgroundColor: .white, isShadowed: true)
    
    private let logoImageView = UIImageView(image: #imageLiteral(resourceName: "chat-box"), contentMode: .scaleAspectFit)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        messengerAppInfo.addTarget(self, action: #selector(showMessengerAppInfo), for: .touchUpInside)
        
        
        signUpVC.delegate = self
        loginVC.delegate = self
    }
    
    @objc private func emailButtonTapped() {
        print(#function)
        
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
        present(loginVC, animated: true, completion: nil)
    }
    
    private func setUpUI() {
        messengerAppInfo.customizeGoogleButton()
        view.addSubview(logoImageView)
        setUpConstraints()
    }

}

extension AuthViewController {
    @objc private func showMessengerAppInfo() {
        let alert = UIAlertController(title: "@MessengerApp Info", message: "The application was developed by Arthur Lee (GitHub: @rleydev)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Return back", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension AuthViewController {
    private func setUpConstraints() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let googleView = ButtonFormView(label: messangerDescriptionLabel, button: messengerAppInfo)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardedLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}


extension AuthViewController: AuthNavigationDelegate {
    func toLogVC() {
        present(loginVC, animated: true, completion: nil)
    }
    
    func toSignUpVC() {
        present(signUpVC, animated: true, completion: nil)
    }
    
    
}

import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
