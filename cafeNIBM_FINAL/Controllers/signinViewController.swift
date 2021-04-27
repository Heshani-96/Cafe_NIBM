//
//  signinViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-22.
//

import UIKit
import Firebase

class signinViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnSignin(_ sender: UIButton) {
        if validateInput(){
            authenticateUser(email: txtEmail.text!, password: txtPassword.text!)
            
        }else {
            print("input error found")
        }
    }
 
    func validateInput() -> Bool {
        guard let email = txtEmail.text else {
            print("email is NULL")
            return false
        }
        guard let password = txtPassword.text else {
            print("password is NULL")
            return false
        }
        if email.count < 5 {
            print("Enter a valid email")
            return false
        }
        if password.count < 5 {
            print("Enter a valid password")
            return false
        }
    return true
    }
    
    func authenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            
            if let err = error{
                print(err.localizedDescription)
                return
            }
            if let result = authResult {
                print("User Email : \(result.user.email ?? "No Found")")
            }
        }
        
    }

}
