//
//  SessionManager.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-28.
//

import Foundation

class SessionManager {
    
    
    func getLoggedState() -> Bool {
     return UserDefaults.standard.bool(forKey: "LOGGED_IN")
  
    }
    
    func saveUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "LOGGED_IN")
    }
    
    func clearUserLoggedState(){
        UserDefaults.standard.setValue(false, forKey: "LOGGED_IN")
    }
    
}
