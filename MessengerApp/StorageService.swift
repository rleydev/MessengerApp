//
//  StorageService.swift
//  MessengerApp
//
//  Created by Arthur Lee on 14.08.2022.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    
    let storageRef = Storage.storage().reference()
    
    private var avatarRef: StorageReference {
        return storageRef.child("avatars")
    }
    
    private var currrentUSerId: String {
        return Auth.auth().currentUser!.uid
    }
    
    func upload(photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        
        guard let scaledImage = photo.scaledToSafeUploadSize, let imageData = scaledImage.jpegData(compressionQuality: 0.4) else { return }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        avatarRef.child(currrentUSerId).putData(imageData, metadata: metaData) { (metadata, error) in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            
            self.avatarRef.child(self.currrentUSerId).downloadURL { (url, error) in
                guard let dowbloadURL = url else {
                    completion(.failure(error!))
                    return
                }
                
                completion(.success(dowbloadURL))
            }
        }
    }
}
