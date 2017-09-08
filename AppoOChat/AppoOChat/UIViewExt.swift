//
//  UIViewExt.swift
//  AppoOChat
//
//  Created by admin on 06/09/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import UIKit

extension UIView{
    func bindToKeybord(){
        NotificationCenter.default.addObserver(self, selector: #selector(_ :), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    @objc func keyboardWillChange(notification: NSNotification){
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - beginningFrame.origin.y
        
        UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>)
    }
}
