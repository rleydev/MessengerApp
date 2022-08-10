//
//  UserCell.swift
//  MessengerApp
//
//  Created by Arthur Lee on 10.08.2022.
//

import UIKit

class UserCell: UICollectionViewCell, SelfConfiguringCell {
    
    let userImageView = UIImageView()
    let userName = UILabel(text: "text", font: .laoSangnamMN20())
    let contanerView = UIView()
    
    static var reuseId: String = "USerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
        
        self.layer.cornerRadius = 10
        
        self.layer.shadowColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contanerView.layer.cornerRadius = 10
        self.contanerView.clipsToBounds = true
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageView.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }
    
    private func setUpConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        contanerView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.backgroundColor = .yellow
        
        addSubview(contanerView)
        contanerView.addSubview(userName)
        contanerView.addSubview(userImageView)
        
        NSLayoutConstraint.activate([
            contanerView.topAnchor.constraint(equalTo: self.topAnchor),
            contanerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contanerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contanerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            userImageView.topAnchor.constraint(equalTo: contanerView.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: contanerView.widthAnchor),
            
            userName.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            userName.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor, constant: -8),
            userName.bottomAnchor.constraint(equalTo: contanerView.bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
import SwiftUI

struct UserChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserChatProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UserChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserChatProvider.ContainerView>) {
            
        }
    }
}

