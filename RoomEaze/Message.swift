//
//  Message.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/8/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation

import UIKit
import Firebase
import MessageKit

struct Message {
    
    var id: String
    var content: String
    var created: Timestamp
    var senderID: String
    var senderName: String
    var recipientSeen = false
    
    var dictionary: [String: Any] {
        
        return [
            "id": id,
            "content": content,
            "created": created,
            "senderID": senderID,
            "senderName":senderName,
            "recipientSeen": recipientSeen
        ]
        
    }
    mutating func setSeen(ref: DocumentReference, completed: @escaping ()->()) {
        self.recipientSeen = true
        let dataToSave = self.dictionary
        ref.setData(dataToSave)
        completed()
    }
}

extension Message {
    init?(dictionary: [String: Any]) {
        
        guard let id = dictionary["id"] as? String,
            let content = dictionary["content"] as? String,
            let created = dictionary["created"] as? Timestamp,
            let senderID = dictionary["senderID"] as? String,
            let senderName = dictionary["senderName"] as? String,
            let recipientSeen = dictionary["recipientSeen"] as? Bool
            else {return nil}
        
        self.init(id: id, content: content, created: created, senderID: senderID, senderName:senderName, recipientSeen: recipientSeen
        )
        
    }
}


extension Message: MessageType {
    
    var sender: SenderType {
        return Sender(id: senderID, displayName: senderName)
    }
    
    var messageId: String {
        return id
    }
    var read: Bool{
        return recipientSeen
    }
    var sentDate: Date {
        return created.dateValue()
    }
    
    var kind: MessageKind {
        return .text(content)
    }
}
