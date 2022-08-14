//
//  WaitingChatCell.swift
//  MessengerApp
//
//  Created by Arthur Lee on 10.08.2022.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.cornerRadius = 10
        clipsToBounds = true
        setUpConstraints()
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
//        friendImageView.image = UIImage(named: chat.userImageString)
    }
    
    private func setUpConstraints() {
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



import SwiftUI

struct WaitingChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        private let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: WaitingChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) {
            
        }
    }
}

