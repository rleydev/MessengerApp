//
//  ChatRequestViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 11.08.2022.
//

import UIKit

class ChatRequestViewController: UIViewController {
    
    private let containerView = UIView()
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "human2"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(text: "Name Surname", font: .systemFont(ofSize: 20, weight: .light))
    private let aboutMeLabel = UILabel(text: "You have an opportunity to start a new chat", font: .systemFont(ofSize: 16, weight: .light))
    
    private let acceptButton = UIButton(title: "Accept", titleColor: .white, backgroundColor: .black, font: .laoSangnamMN20(), isShadowed: false, corenerRadius: 10)
    private let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1), backgroundColor: .white, font: .laoSangnamMN20(), isShadowed: false, corenerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.acceptButton.applyGradients(cornerRadius: 10)
    }
    
    private func setUpUI() {
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1)
        denyButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
       
        
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually

        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56)

        ])
    }
    
}

extension ChatRequestViewController {
    
    private func setUpConstraints() {
        
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
            ])
    }
}


import SwiftUI

struct ChatRequestViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ChatRequestViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
