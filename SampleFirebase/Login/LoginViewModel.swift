//
//  LoginViewModel.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 26/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    
    struct Credential {
        let username: String
        let password: String
    }

    var currentUser: User? { return Auth.auth().currentUser }
    
    func login(userName: String, passowrd: String, completion: AuthResultCallback? = nil) {
        Auth.auth().signIn(withEmail: userName, password: passowrd, completion: completion)
    }
    
    func register(WithCrediential cred: Credential, completion: AuthResultCallback? = nil) {
        Auth.auth().createUser(withEmail: cred.username, password: cred.password, completion: completion)
    }
    
    var isEmailVerified: Bool {
       return currentUser?.isEmailVerified ?? false
    }
    
    func sendVerificationEmail(completion: SendEmailVerificationCallback? = nil) {
        currentUser?.sendEmailVerification(completion: completion)
    }
    
}
