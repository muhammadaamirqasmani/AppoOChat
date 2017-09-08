//
//  DataService.swift
//  AppoOChat
//
//  Created by Muhammad Aamir on 16/08/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()
class DataService {
    
    static let instance = DataService()
    
    
    private var _REF_BASE = DB_BASE
    private var _REF_USER = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    
    var REF_BASE: FIRDatabaseReference{
        return _REF_BASE
    }
    var REF_USER: FIRDatabaseReference{
    return _REF_USER
    }
    var REF_GROUPS: FIRDatabaseReference{
        return _REF_GROUPS
    }
    var REF_FEED: FIRDatabaseReference{
        return _REF_FEED
    }
    
    
    func CreateDBUser(uid:String, userData:Dictionary<String,Any>) {
        REF_USER.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(withMessage message:String, forUID uid:String, WithGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool)->()) {
        if groupKey != nil{
            // send to group Ref
        }else{
            REF_FEED.childByAutoId().updateChildValues(["content" : message, "senderID" : uid])
            sendComplete(true)
        }
    }
}
