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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultHelper.helper.readData()
    }
    
    @IBAction func logInBtnTapped(_ sender: Any) {
        

        if userNameTextFeild.text == UserDefaultHelper.helper.userName && passwordTextFeild.text == UserDefaultHelper.helper.password {
            
            UserDefaultHelper.helper.logIn()
            
            let vc = GeminiViewController(nibName:"GeminiViewController",bundle:nil)
            self.navigationController?.pushViewController(vc,animated:true)
            
          }
          else{
              showAlert(title: "LogIn", message: "Invalid Id & password")
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
}
