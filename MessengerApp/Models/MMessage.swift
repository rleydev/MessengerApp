//
//  MMessage.swift
//  MessengerApp
//
//  Created by Arthur Lee on 14.08.2022.
//

import UIKit
import FirebaseFirestore

struct MMessage: Hashable {
    let content: String
    let senderId: String
    let senderUsername: String
    var sentDate: Date
    let id: String?
    
    init(user: MUser, content: String) {
        self.content = content
        senderId = user.id
        senderUsername = user.username
        sentDate = Date()
        id = nil
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let sentDate = data["created"] as? Timestamp else { return nil }
        guard let senderId = data["senderID"] as? String else { return nil }
        guard let senderUsername = data["senderName"] as? String else { return nil }
        guard let content = data["content"] as? String else { return nil }
        
        self.id = document.documentID
        self.sentDate = sentDate.dateValue()
        self.senderId = senderId
        self.senderUsername = senderUsername
        self.content = content
    }
    
    var representation: [String: Any] {
        var rep: [String: Any] = [
            "created": sentDate,
            "senderID": senderId,
            "senderName": senderUsername,
            "content": content 
        ]
        
        return rep
    }
}
