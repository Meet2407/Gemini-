//
//  LuchScreenViewController.swift
//  Gemini
//
//  Created by Meet Kapadiya on 16/09/24.
//

import UIKit

class LuchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   //      Do any additional setup after loading the view.
     
    }
    
    @IBAction func logInBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GeminiLogInViewController") as! GeminiLogInViewController
         navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SignUpBtnTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GeminiSignUpViewController") as! GeminiSignUpViewController
         navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
