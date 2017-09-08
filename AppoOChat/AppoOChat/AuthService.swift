//
//  AuthService.swift
//  AppoOChat
//
//  Created by admin on 29/08/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import Foundation
import Firebase

class  AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email:String, andPassword password:String,userCreateComplete: @escaping (_ status:Bool, _ error: Error?) -> ())  {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            guard let user = user else {
                userCreateComplete(true, nil)
                return
            }
            let userData = ["provider":user.providerID, "email": user.email]
            DataService.instance.CreateDBUser(uid: user.uid, userData: userData as Any as! Dictionary<String, Any> )
            userCreateComplete(true, nil)
        })
    }
    
    func loginUser(withEmail email:String, andPassword password:String,loginComplete: @escaping (_ status:Bool, _ error: Error?) -> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in if error != nil {
            loginComplete(false, error)
            return
            }
            loginComplete(true, nil)
        })
        
    }
    
    
    
}





