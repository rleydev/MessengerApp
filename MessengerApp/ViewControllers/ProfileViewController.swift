//
//  ProfileViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 11.08.2022.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    private let containerView = UIView()
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "human2"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(text: "Name Surname", font: .systemFont(ofSize: 20, weight: .light))
    private let aboutMeLabel = UILabel(text: "Some Information", font: .systemFont(ofSize: 16, weight: .light))
    private let myTextField = InsertableTextField()
    
    private let user: MUser
    
    init(user: MUser) {
        self.user = user
        self.nameLabel.text = user.username
        self.aboutMeLabel.text = user.description
        self.imageView.sd_setImage(with: URL(string: user.avatarStringURL), completed: nil)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpConstraints()
    }
    
    private func setUpUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        if let button = myTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
    }
    
    @objc private func sendMessage() {
        print(#function)
        
        guard let message = myTextField.text, message != "" else { return }
        
        self.dismiss(animated: true) {
            FirestoreService.shared.createWaitingChat(message: message, receiver: self.user) { result in
                switch result {
                    
                case .success():
                    UIApplication.getTopViewController()?.showAlert(with: "Success!", and: "Your message was sent to \(self.user.username)")
                case .failure(let error):
                    UIApplication.getTopViewController()?.showAlert(with: "Error", and: error.localizedDescription)
                }
            }
            
        }
    }
    
}

extension ProfileViewController {
    
    private func setUpConstraints() {
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(myTextField)
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            myTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

//import SwiftUI
//
//struct ProfileViewControllerProvider: PreviewProvider {
//
//    static var previews: some View {
//        ContainerView().edgesIgnoringSafeArea(.all)
//    }
//    
//    struct ContainerView: UIViewControllerRepresentable {
//        
//        let viewController = ProfileViewController()
//        
//        func makeUIViewController(context: Context) -> some UIViewController {
//            return viewController
//        }
//        
//        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//            
//        }
//    }
//}
