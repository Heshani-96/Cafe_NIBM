//
//  launchViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-30.
//

import UIKit

class launchViewController: UIViewController {
    let sessionManager = SessionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if sessionManager.getLoggedState() {
            self.performSegue(withIdentifier: "lanchToHomeScreen", sender: nil)
        } else {
            self.performSegue(withIdentifier: "launchToSignIn", sender: nil)
        }
    }
}
