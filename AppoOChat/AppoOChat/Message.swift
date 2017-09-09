//
//  Message.swift
//  AppoOChat
//
//  Created by admin on 09/09/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import Foundation

class Message{
    private var _content: String
    private var _senderID: String
    
    var content:String {
        return _content
    }
    var senderID:String{
        return _senderID
    }
    
    init(content:String, senderID:String) {
        self._content = content
        self._senderID = senderID
    }
}
