//
//  GeminiSignUpViewController.swift
//  Gemini
//
//  Created by Meet Kapadiya on 16/09/24.
//

import UIKit

class GeminiSignUpViewController: UIViewController {
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var confirmPasswordTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var emailIdTextFeild: UITextField!
    @IBOutlet weak var userNameTextFeild: UITextField!
    
    var userName: String = ""
    var emailId: String = ""
    var password: String = ""
    var confirmPassWord: String = ""
    
    
    let singUpMethod = UserDefaultHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func signInBtnTapped(_ sender: Any) {
        // Validate input fields
        if userNameTextFeild.text?.isEmpty == true {
            showAlert(title: "Registration", message: "Please enter your name")
            return
        }
        
        if emailIdTextFeild.text?.isEmpty == true {
            showAlert(title: "Registration", message: "Please enter your email")
                return
        }
        
        if passwordTextFeild.text?.isEmpty == true {
            showAlert(title: "Registration", message: "Please enter your password")
            return
        }
        
        if confirmPasswordTextFeild.text?.isEmpty == true {
            showAlert(title: "Registration", message: "Please confirm your password")
            return
        }
        
        // Get user inputs
        userName = userNameTextFeild.text ?? ""
        emailId = emailIdTextFeild.text ?? ""
        password = passwordTextFeild.text ?? ""
        confirmPassWord = confirmPasswordTextFeild.text ?? ""
        
        // Validate email and password
        if !isValidEmail(emailId) {
            showAlertMeesage(message: "Please Enter a Valid Email Id")
            return
        }
        
        if !isValidPassword(password) {
            showAlertMeesage(message: "Please Enter a Valid Password")
            return
        }
        
        // Check if passwords match
        if password == confirmPassWord {
            // Proceed with the signup process
            singUpMethod.singUp(userName: userName, emailId: emailId, passWord: password, confirmPassWord: confirmPassWord)
            
            // Navigate to the next view controller after a successful signup
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LuchScreenViewController") as! LuchScreenViewController
            navigationController?.pushViewController(vc, animated: true)
        } else {
            showAlertMeesage(message: "Please Enter the Correct Password and Confirm Password")
        }
    }

    
    public func showAlert(title: String, message: String){
          
          let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let okButton = UIAlertAction(title: "OK", style: .default)
          
          alertMessagePopUpBox.addAction(okButton)
          self.present(alertMessagePopUpBox, animated: true)
      }
    
    public func showAlertMeesage(message: String){
          
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
      }
    
    
    @IBAction func logInBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GeminiLogInViewController") as! GeminiLogInViewController
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
