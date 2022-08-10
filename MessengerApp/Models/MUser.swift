//
//  MUser.swift
//  MessengerApp
//
//  Created by Arthur Lee on 10.08.2022.
//

import Foundation

struct MUser: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let loweredCasedFilter = filter.lowercased()
        
        return username.lowercased().contains(loweredCasedFilter)
    }
}

