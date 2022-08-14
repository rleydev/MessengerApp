//
//  FirestoreService.swift
//  MessengerApp
//
//  Created by Arthur Lee on 11.08.2022.
//

import UIKit
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let dataBase = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return dataBase.collection("users")
    }
    
    var currentUser: MUser!
    
    private var waitingChatsRef: CollectionReference {
        return dataBase.collection(["users", currentUser.id, "waitingChats"].joined(separator: "/"))
    }
    
    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void) {
        let docRef = userRef.document(user.uid)
        docRef.getDocument {  (document, error) in
            if let document = document, document.exists {
                guard let muser = MUser(document: document) else {
                    completion(.failure(UserError.canNotUnwrapToMUser))
                    return
                }
                self.currentUser = muser
                completion(.success(muser))
            } else {
                completion(.failure(UserError.canNotGetUserInfo))
            }
        }
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImage: UIImage?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        guard avatarImage != UIImage(named: "avatar") else {
            completion(.failure(UserError.photoNotExist))
            return
        }
        
        var muser = MUser(username: username!,
                          email: email, avatarStringURL: "not exist",
                          description: description! ,
                          sex: sex!,
                          id: id)
        
        StorageService.shared.upload(photo: avatarImage!) { (result) in
            switch result {
            case .success(let url):
                
                muser.avatarStringURL = url.absoluteString
                
                self.userRef.document(muser.id).setData(muser.representation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(muser))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        } // Storage service
        
    } // Save profile
    
    func createWaitingChat(message: String, receiver: MUser, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let reference = dataBase.collection(["users", receiver.id, "waitingChats"].joined(separator: "/"))
        let messageRef = reference.document(self.currentUser.id).collection("messages")
        
        let message = MMessage(user: currentUser, content: message)
        
        let chat = MChat(friendUsername: currentUser.username, friendAvatarStringURL: currentUser.avatarStringURL, lastMessageContent: message.content, friendId: currentUser.id)
        
        reference.document(currentUser.id).setData(chat.representation) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            messageRef.addDocument(data: message.representation) { error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                completion(.success(Void()))
            }
        }
    }
    
    func deleteWaitingChat(chat: MChat, completion: @escaping (Result<Void, Error>) -> Void) {
        waitingChatsRef.document(chat.friendId).delete { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(Void()))
            self.deleteMessages(chat: chat, completion: completion)
        }
    }
    
    private func deleteMessages(chat: MChat, completion: @escaping (Result<Void, Error>) -> Void) {
        let reference = waitingChatsRef.document(chat.friendId).collection("messages")
        getWaitingChatMessages(chat: chat) { result in
            switch result {
                
            case .success(let messages):
                for message in messages {
                    guard let documentId = message.id else { return }
                    let messageRef = reference.document(documentId)
                    messageRef.delete { error in
                        if let error = error {
                            completion(.failure(error))
                            return
                        }
                        completion(.success(Void()))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    private func getWaitingChatMessages(chat: MChat, completion: @escaping (Result<[MMessage], Error>) -> Void) {
        let reference = waitingChatsRef.document(chat.friendId).collection("messages")
        var messages = [MMessage]()
        reference.getDocuments { querySnapshot, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            for document in querySnapshot!.documents {
                guard let message = MMessage(document: document) else { return }
                messages.append(message)
            }
            
            completion(.success(messages))
        }
    }
}
