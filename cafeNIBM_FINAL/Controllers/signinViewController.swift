//
//  signinViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-22.
//

import UIKit
import Firebase
import Loaf

class signinViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnSignin(_ sender: UIButton) {
        
        if !inputValidator.isValidEmai(email: txtEmail.text ?? "") {
            Loaf("Invalid Email Address!!", state: .error, sender: self).show()
            return
        }
        
        if !inputValidator.isValidPassword(password: txtPassword.text ?? "", minLength: 6, maxLength: 15) {
            Loaf("Invalid Password!!", state: .error, sender: self).show()
            return
        }
        authenticateUser(email: txtEmail.text!, password: txtPassword.text!)
    }
 
    func authenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            
            if let err = error{
                print(err.localizedDescription)
                Loaf("username or password is invalid", state: .error, sender: self).show()
                return
            }
            
            let sessionManager = SessionManager()
            sessionManager.saveUserLogin()
            self.performSegue(withIdentifier: "signInToHome", sender: nil)
            
        }
    }
}
