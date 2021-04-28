//
//  SignUpViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-28.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func onSignUpPressed(_ sender: Any) {
        if validateInput() {
            registerUser(email: txtEmail.text!, password: txtPassword.text!)
        } else {
            print("Eroor found")
        }
    }
    
    @IBAction func onSignInPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func registerUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            if let result = authResult {
                print("user added with email: \(result.user.email ?? "Not Found")")

            }
        }
        
    }
    
    func validateInput() -> Bool {
        guard let name = txtName.text else {
            print("Name is Null")
            return false
        }
        guard let email = txtEmail.text else {
            print("email is Null")
            return false
        }
        guard let phone = txtPhoneNo.text else {
            print("Phone Number is Null")
            return false
        }
        guard let password = txtPassword.text else {
            print("Password is Null")
            return false
        }
        
        if name.count < 5 {
            print("Enter a valid name")
            return false
        }
        if email.count < 5 {
            print("Enter a valid email")
            return false
        }
        if phone.count < 5 {
            print("Enter a valid phone no")
            return false
        }
        if password.count < 5 {
            print("Enter a valid password")
            return false
        }
        
        return true
    }
}
