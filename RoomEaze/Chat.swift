//
//  Chat.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/8/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import UIKit
struct Chat {
var users: [String]
var dictionary: [String: Any] {
return ["users": users]
   }
    
}

extension Chat {
init?(dictionary: [String:Any]) {
guard let chatUsers = dictionary["users"] as? [String] else {return nil}
self.init(users: chatUsers)
}
}
