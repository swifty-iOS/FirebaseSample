//
//  NSObject+Utility.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 26/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var className: String { return String (describing: self) }
    var className: String { return String (describing: self) }
    
}
