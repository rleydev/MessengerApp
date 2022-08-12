//
//  SetUpProfileViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 09.08.2022.
//

import UIKit
import FirebaseAuth

class SetUpProfileViewController: UIViewController {
    
    private let fullImageView = PhotoView()
    
    private let welcomeLabel = UILabel(text: "Set up your Profile!", font: .avenir26())
    private let fullNameLabel = UILabel(text: "Full Name")
    private let aboutMeLabel = UILabel(text: "About me")
    private let sexLabel = UILabel(text: "Sex")
    
    private let fullNameTextField = OneLineTextField(font: .avenir20())
    private let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    private let sexSegmentedControll = UISegmentedControl(first: "Male", second: "Female")
    
    private let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 10)
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpConstraints()
        goToChatsButton.addTarget(self, action: #selector(goToChatsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func goToChatsButtonTapped() {
        FirestoreService.shared.saveProfileWith(id: currentUser.uid, email: currentUser.email!, username: fullNameTextField.text, avatarImageString: nil, description: aboutMeTextField.text, sex: sexSegmentedControll.titleForSegment(at: sexSegmentedControll.selectedSegmentIndex)) { (result) in
            switch result {
            case .success(let muser):
                self.showAlert(with: "Success!", and: "Have a nice chat") {
                    self.present(MainTabBarController(), animated: true, completion: nil)
                }
            case .failure(_):
                self.showAlert(with: "Error!", and: "")
            }
        }
    }
}

extension SetUpProfileViewController {
    private func setUpConstraints() {
        
        let fillNameStackView = UIStackView(arrangedSubviews: [ fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [ aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        let sexStackViewStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControll], axis: .vertical, spacing: 12)
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [
            fillNameStackView,
            aboutMeStackView,
            sexStackViewStackView,
            goToChatsButton
        ],
                                    axis: .vertical,
                                    spacing: 40)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}

import SwiftUI

struct SetUpProfileViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetUpProfileViewController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
