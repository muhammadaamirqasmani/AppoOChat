//
//  LoginVC.swift
//  AppoOChat
//
//  Created by Muhammad Aamir on 17/08/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    
    @IBOutlet weak var emailField: InsertTextField!
    @IBOutlet weak var passwordField: InsertTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        }
    
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else {
                    print(String(describing: loginError?.localizedDescription))
                }
            AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreateComplete: { (success, registrationError) in
                if success{
                    AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                        self.dismiss(animated: true, completion: nil)
                        print("Successfully Register User")
                    })
                }else{
                    print(String(describing: registrationError?.localizedDescription))
                }
            })
                
            })
        }
//   
//        if emailField.text != nil && passwordField.text != nil {
//            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
//                if success {
//                    self.dismiss(animated: true, completion: nil)
//                } else {
//                    print(String(describing: loginError?.localizedDescription))
//                }
//                
//                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreateComplete: { (success, registrationError) in
//                    if success {
//                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
//                            self.dismiss(animated: true, completion: nil)
//                            print("Successfully registered user")
//                        })
//                    } else {
//                        print(String(describing: registrationError?.localizedDescription))
//                    }
//                })
//            })
//        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension LoginVC: UITextFieldDelegate {}







