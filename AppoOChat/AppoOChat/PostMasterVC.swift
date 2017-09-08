//
//  PostMasterVC.swift
//  AppoOChat
//
//  Created by admin on 05/09/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import UIKit
import Firebase
class PostMasterVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userEmaiID: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self

        // Do any additional setup after loading the view.
    }

  
   
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say Something Here..."{
        sendBtn.isEnabled = false
        DataService.instance.uploadPost(withMessage: textView.text, forUID:
            (FIRAuth.auth()?.currentUser?.uid)!, WithGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.sendBtn.isEnabled = true
                    print("There are some Error...!!!")
                }
        })
        }
    }

    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
}
extension PostMasterVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
