//
//  forgotPasswordViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-05-08.
//

import UIKit
import Firebase
import Loaf

class forgotPasswordViewController: UIViewController {

    @IBOutlet weak var txtemail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnback(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnsubmit(_ sender: UIButton) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: txtemail.text!) { (error) in
            if let err = error {
                Loaf("\(err)", state: .error, sender: self).show()
                
                return
            }
        }
    }
    
}
