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
    
    
    func getUsername(forUID uid:String, handler: @escaping (_ username: String) -> ()){
        REF_USER.observeSingleEvent(of: .value, with: { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [FIRDataSnapshot] else {
                return
            }
            for user in userSnapshot {
                if user.key == uid{
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        })
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages:[Message]) ->()) {
        var messageArray = [Message]()
        REF_FEED.observeSingleEvent(of: .value, with: { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [FIRDataSnapshot] else {return}
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderID").value as! String
                let message = Message(content: content, senderID: senderId)
                messageArray.append(message)
            }   
            handler(messageArray)
        })
        
    }
}
