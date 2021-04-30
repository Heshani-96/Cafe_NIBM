//
//  SignUpViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-28.
//

import UIKit
import Firebase
import Loaf

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()


    }
    
    @IBAction func onSignUpPressed(_ sender: UIButton) {
        
        if !inputValidator.isValidName(name: txtName.text ?? "") {
            Loaf("Invalid Name!!", state: .error, sender: self).show()
            return
        }
        if !inputValidator.isValidEmai(email: txtEmail.text ?? "") {
            Loaf("Invalid Email Address!!", state: .error, sender: self).show()
            return
        }
        
        if !inputValidator.isValidMobile(mobile: txtPhoneNo.text ?? "") {
            Loaf("Invalid Mobile No!!", state: .error, sender: self).show()
            return
        }
        
        if !inputValidator.isValidPassword(password: txtPassword.text ?? "", minLength: 6, maxLength: 15) {
            Loaf("Invalid Password!!", state: .error, sender: self).show()
            return
        }
        registerUser(email: txtEmail.text!, password: txtPassword.text!)
    }
    
    @IBAction func onSignInPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func registerUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print(err.localizedDescription)
                Loaf("User signup failed!!", state: .error, sender: self).show()

                return
            }
            
            let user = User
            saveUserInformation(user: <#T##User#>)
            
            if let result = authResult {
                print("user added with email: \(result.user.email ?? "Not Found")")
                Loaf("User registered sucessfully", state: .success, sender: self).show()


            }
        }
    }
    
    func saveUserInformation(user: User) {
        self.ref.child("users").child(user.email ?? "").setValue(user) {
            (Error, ref) in
            
            if let err = Error{
                print(err.localizedDescription)
                Loaf("User Information not saved on DB", state: .error, sender: self).show()
                return
            }
            
            Loaf("User Information saved on DB", state: .error, sender: self).show()

        }
    }
    
}
