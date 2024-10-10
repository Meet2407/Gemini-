//
//  LogIn&SignIn .swift
//  Gemini
//
//  Created by Meet Kapadiya on 16/09/24.
//

import Foundation

class UserDefaultHelper{
    
    static var helper = UserDefaultHelper()
    
    var userName: String = ""
    var password: String = ""

    func singUp(userName: String,emailId: String,passWord: String, confirmPassWord: String){
        UserDefaults.standard.setValue(userName, forKey: "UserName")
        UserDefaults.standard.setValue(emailId, forKey: "emailId")
        UserDefaults.standard.setValue(passWord, forKey: "Password")
        UserDefaults.standard.setValue(confirmPassWord, forKey: "ConfirmPassword")
    }
    
    func logIn(){
        UserDefaults.standard.setValue(true, forKey: "USER_LOGIN")
    }

    func getLoginStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "USER_LOGIN")
    }
    
    
    func readData()
    {
        userName = UserDefaults.standard.string(forKey: "emailId") ?? ""
        password = UserDefaults.standard.string(forKey: "Password") ?? ""
        
    }
}

