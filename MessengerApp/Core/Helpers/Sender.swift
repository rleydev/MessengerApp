//
//  Sender.swift
//  MessengerApp
//
//  Created by Arthur Lee on 15.08.2022.
//

import Foundation
import MessageKit

public struct Sender: SenderType {
    public let senderId: String

    public let displayName: String
}
