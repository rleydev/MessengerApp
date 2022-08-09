//
//  SetUpProfileViewController.swift
//  MessengerApp
//
//  Created by Arthur Lee on 09.08.2022.
//

import UIKit

class SetUpProfileViewController: UIViewController {
    
    let fullImageView = PhotoView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpConstraints()
    }
    
     
}

extension SetUpProfileViewController {
    private func setUpConstraints() {
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fullImageView)
        
        fullImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

import SwiftUI

struct SetUpProfileViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetUpProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
