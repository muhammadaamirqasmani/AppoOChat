//
//  AuthVC.swift
//  AppoOChat
//
//  Created by Muhammad Aamir on 17/08/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import UIKit
import Firebase
class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FIRAuth.auth()?.currentUser != nil{
            dismiss(animated: true, completion: nil)}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FBBtnWasPressed(_ sender: Any) {
    }

    @IBAction func GPlusBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func emailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
}
