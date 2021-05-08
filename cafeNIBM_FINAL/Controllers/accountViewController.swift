//
//  accountViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-30.
//

import UIKit

class accountViewController: UIViewController {
     
    let sessionManager = SessionManager()

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var lblUserPhoneNo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = sessionManager.getUserData()
        lblUserName.text = user.userName
        lblUserEmail.text = user.email
        lblUserPhoneNo.text = user.phoneNo
        
    }
    @IBAction func btnSignOut(_ sender: UIButton) {
        sessionManager.clearUserLoggedState()
        dismiss(animated: true, completion: nil)
    }
}
