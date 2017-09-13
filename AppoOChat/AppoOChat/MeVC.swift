//
//  MeVC.swift
//  AppoOChat
//
//  Created by admin on 05/09/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emailLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = FIRAuth.auth()?.currentUser?.email
        print(FIRAuth.auth()?.currentUser?.email)
    }

    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        
        let logoutPopup = UIAlertController(title: "Logout...???", message: "Are You Sure", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout...?", style: .destructive) { (buttonTapped) in
            
            do{
            try FIRAuth.auth()?.signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as! AuthVC
                self.present(authVC, animated: true, completion: nil)
            }catch{
                print(error)
            }
            
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }


}
