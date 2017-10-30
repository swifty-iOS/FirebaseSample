//
//  DataManager.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 27/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataManager {
    
    static var shared: DataManager = DataManager()
    let ref: DatabaseReference!
    private init() {
        ref = Database.database().reference()
    }
}
