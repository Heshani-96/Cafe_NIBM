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
    
    func saveUserLogin(user: User) {
        UserDefaults.standard.setValue(true, forKey: "USER_LOGGED")
        UserDefaults.standard.setValue(user.userName, forKey: "USER_NAME")
        UserDefaults.standard.setValue(user.email, forKey: "USER_EMAIL")
        UserDefaults.standard.setValue(user.phoneNo, forKey: "USER_PHONENO")

    }
    func getUserData() -> User{
        let user = User(userName: UserDefaults.standard.string(forKey: "USER_NAME") ?? "",
                        email: UserDefaults.standard.string(forKey: "USER_EMAIL") ?? "",
                        password: "",
                        phoneNo: UserDefaults.standard.string(forKey: "USER_PHONENO") ?? "")
        return user
        
    }
    
    
    
    
    func clearUserLoggedState(){
        UserDefaults.standard.setValue(false, forKey: "LOGGED_IN")
    }
    
}
