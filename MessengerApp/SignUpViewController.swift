//
//  SignUpViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 09.08.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Welcome!", font: .avenir26())
    
    let emailLabel = UILabel(text: "Email")
    
    let passwordLabel = UILabel(text: "Password")
    
    let confirmPasswordLabel = UILabel(text: "Confirm your password")
    
    let alreadyOnboardedLabel = UILabel(text: "Already have an account?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let confirmTextField = OneLineTextField(font: .avenir20())
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonDark())
    
    let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLoginButton()
        setUpUIandConstraints()
    }
}

extension SignUpViewController {
    private func setUpLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.buttonRed(), for: .normal)
        loginButton.titleLabel?.font = .avenir20()
        
    }
    private func setUpUIandConstraints() {
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        let confirmPasswordSatckView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmTextField], axis: .vertical, spacing: 0)
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordSatckView, signUpButton], axis: .vertical, spacing: 40)
        
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyOnboardedLabel, loginButton], axis: .horizontal, spacing: -1)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 160),

            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -40)
        ])
 
    }
}

import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

