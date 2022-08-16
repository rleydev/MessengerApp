//
//  WaitingChatsNavigation.swift
//  MessengerApp
//
//  Created by Arthur Lee on 15.08.2022.
//

import Foundation

protocol WaitingChatsNavigation: AnyObject {
    func removeWaitingChat(chat: MChat)
    func chatToActive(chat: MChat)
}
