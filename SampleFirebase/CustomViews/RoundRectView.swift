//
//  RoundRectView.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 26/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class RoundRectView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = 5
    }
}
