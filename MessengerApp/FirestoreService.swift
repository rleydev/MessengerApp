//
//  FirestoreService.swift
//  MessengerApp
//
//  Created by Arthur Lee on 11.08.2022.
//

import FirebaseCore
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let dataBase = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return dataBase.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, decription: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: decription, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let muser = MUser(username: username!,
                         avatarStringURL: "not exist",
                         id: id,
                         email: email ,
                         decription: decription!,
                         sex: sex!)
        
        self.userRef.document(muser.id).setData(muser.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
    }
}
