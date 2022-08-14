//
//  MChat.swift
//  MessengerApp
//
//  Created by Arthur Lee on 10.08.2022.
//

import Foundation

struct MChat: Hashable, Decodable {
    var friendUsername: String
    var friendAvatarStringURL: String
    var lastMessageContent: String
    var friendId: String
    
    var representation: [String: Any] {
        var rep = ["friendUsername": friendUsername]
        rep["friendAvatarStringURL"] = friendAvatarStringURL
        rep["friendId"] = friendId
        rep["lastMessage"] = lastMessageContent
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(friendId)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.friendId == rhs.friendId
    }
}
