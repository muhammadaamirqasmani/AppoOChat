//
//  ShadowView.swift
//  AppoOChat
//
//  Created by admin on 29/08/2017.
//  Copyright © 2017 Muhammad Aamir. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.green.cgColor
        super.awakeFromNib()
    }

}
