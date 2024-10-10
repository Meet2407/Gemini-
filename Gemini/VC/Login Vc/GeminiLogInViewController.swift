//
//  GeminiLogInViewController.swift
//  Gemini
//
//  Created by Meet Kapadiya on 16/09/24.
//

import UIKit

class GeminiLogInViewController: UIViewController {

    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var userNameTextFeild: UITextField!
   
    let emailid: String = ""
    let password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultHelper.helper.readData()
    }
    
    @IBAction func logInBtnTapped(_ sender: Any) {
       
        
        var email = userNameTextFeild.text ?? ""
        var password = passwordTextFeild.text ?? ""
        
        // Validate email and password
        if !isValidEmail(email) {
            showAlert(title: "LogIn", message: "Please enter a valid email address")
            return
        }

        if !isValidPassword(password) {
            showAlert(title: "LogIn", message: "Password must be at least 8 characters long, include upper and lower case letters, a number, and a special character.")
            return
        }
        
        print(UserDefaultHelper.helper.userName)
        print(UserDefaultHelper.helper.password)
        
        
        // Check if the credentials match
        if email == UserDefaultHelper.helper.userName && password == UserDefaultHelper.helper.password {
            UserDefaultHelper.helper.logIn()
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GeminiViewController") as? GeminiViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            showAlert(title: "LogIn", message: "Invalid ID & password")
        }
        
    }
    
    

    
    public func showAlert(title: String, message: String){
          
          let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let okButton = UIAlertAction(title: "OK", style: .default)
          
          alertMessagePopUpBox.addAction(okButton)
          self.present(alertMessagePopUpBox, animated: true)
      }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GeminiSignUpViewController") as! GeminiSignUpViewController
         navigationController?.pushViewController(vc, animated: true)
    }
    
    // Function to validate email format
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.com$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }

    // Function to validate password strength
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
}
