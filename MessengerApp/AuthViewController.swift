//
//  AuthViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 09.08.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let googleLabel = UILabel(text: "Get started with")
    
    let emailLabel = UILabel(text: "Or sign up with")
    
    let alreadyOnboardedLabel = UILabel(text: "Already onboared")
    
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadowed: true)
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadowed: true)
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
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
