//
//  MMessage.swift
//  MessengerApp
//
//  Created by Arthur Lee on 14.08.2022.
//

import UIKit

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
