//
//  ViewController.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 25/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var loginModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        textFieldUsername.text = "testuser1@mailinator.com"
        textFieldPassword.text = "p@ssw0rd"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(_ sender: UIButton?) {
        performSegue(withIdentifier: SignUpViewController.className, sender: self)
    }
    
    @IBAction func signAction(_ sender: UIButton) {
        LoadingView.show()
        loginModel.login(userName: textFieldUsername.text ?? "", passowrd: textFieldPassword.text ?? "") { [weak self] (user, error) in
            
            LoadingView.hide()
            if user == nil {
                let ok = UIAlertAction(title: "OK", style: .default)
                let signUp = UIAlertAction(title: "Sign Up!", style: .default) { [weak self] _ in
                    self?.signUpAction(nil)
                }
                
                self?.showAlert(title: "Login failed", message: "Please enter valid credential to login or sign up for free.", actions: [signUp, ok])
            } else {
                self?.loginSuccess()
            }
        }
    }
    
    func loginSuccess() {
        if loginModel.isEmailVerified {
            let dashboardVC = storyboard!.instantiateViewController(withIdentifier: DashboardViewController.className)
            self.navigationController?.setViewControllers([dashboardVC], animated: true)
       
        } else {
            let ok = UIAlertAction(title: "OK", style: .default)
            let signUp = UIAlertAction(title: "Resend Verification Email", style: .default) { [weak self] _ in
                self?.loginModel.sendVerificationEmail()
            }
            self.showAlert(title: "Email verification", message: "Please verify your email.", actions: [signUp, ok])
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
