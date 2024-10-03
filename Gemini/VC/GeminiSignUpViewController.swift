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
        
        if userNameTextFeild.text?.isEmpty == true{
            self.showAlert(title: "Registration", message: "please enter first name")
            
        }
        else if emailIdTextFeild.text?.isEmpty == true{
            self.showAlert(title: "Registration", message: "please enter last name")
            
        }else if passwordTextFeild.text?.isEmpty == true{
            self.showAlert(title: "Registration", message: "please enter email")
            
        }else if confirmPasswordTextFeild.text?.isEmpty == true{
            self.showAlert(title: "Registration", message: "please enter password")
        }
        else{
            userName = userNameTextFeild.text ?? ""
            emailId = emailIdTextFeild.text ?? ""
            password = passwordTextFeild.text ?? ""
            confirmPassWord = confirmPasswordTextFeild.text ?? ""
            
            
            singUpMethod.singUp(userName: userName, emailId: emailId, passWord: password, confirmPassWord: confirmPassWord)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LuchScreenViewController") as! LuchScreenViewController
             navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    public func showAlert(title: String, message: String){
          
          let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let okButton = UIAlertAction(title: "OK", style: .default)
          
          alertMessagePopUpBox.addAction(okButton)
          self.present(alertMessagePopUpBox, animated: true)
      }
    
    @IBAction func logInBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GeminiLogInViewController") as! GeminiLogInViewController
         navigationController?.pushViewController(vc, animated: true)
    }
}
