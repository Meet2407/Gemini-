import UIKit

class GeminiViewController: UIViewController {
    
    var geminiDtl = GeminiViewModel()
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var geminiTbl: UITableView!
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.layer.cornerRadius = 5
        sendButton.layer.masksToBounds = true
        geminiTbl.rowHeight = UITableView.automaticDimension
        geminiTbl.estimatedRowHeight = 121
        
        sendButton.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
        hideKeyboardWhenTappedAround()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func sendButtonClicked(_ sender: Any) {
        guard let userInput = textFeild.text, !userInput.isEmpty else {
            print("Please enter some text")
            
            
            return
        }
        data.append("You: \(userInput)")
        
        geminiDtl.geminiDataFatch(inputText: userInput, success: {
            DispatchQueue.main.async {
                if let aiResponse = self.geminiDtl.ans {
                    self.data.append("AI:\n \(aiResponse)")
                }
                self.geminiTbl.reloadData()
                self.textFeild.text = ""
            }
        }, failure: { error in
            print("Failed to fetch data: \(error)")
        })
        
    }
}

extension GeminiViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.geminiTbl.dequeueReusableCell(withIdentifier: "GeminiTableViewCell") as! GeminiTableViewCell
        let conversationText = data[indexPath.row]

        // Check if it's a user message or AI message
        if conversationText.hasPrefix("You:") {
            // User response
            cell.geminiOne?.text = conversationText.replacingOccurrences(of: "You: ", with: "")
            cell.geminiOne.textColor = .white
            cell.geminiOne.textAlignment = .right
            
            // Set background colors
            cell.bgview.backgroundColor = .red // User's message bubble background (e.g., red)
            cell.bgviewTwo.isHidden = true // Hide the second background view since this is a user response
            cell.geminiTwo.isHidden = true // Hide the AI response label for user messages
        } else {
            // AI response
            cell.geminiTwo?.text = conversationText.replacingOccurrences(of: "AI:\n ", with: "")
            cell.geminiTwo.textColor = .black
            cell.geminiTwo.textAlignment = .left
            
            // Set background colors
            cell.bgviewTwo.backgroundColor = .blue // AI's message bubble background (e.g., blue)
            cell.bgview.isHidden = true // Hide the user background view since this is an AI response
            cell.geminiOne.isHidden = true // Hide the user label for AI messages
        }

        // Ensure the labels can wrap to fit longer text
        cell.geminiOne?.numberOfLines = 0
        cell.geminiTwo?.numberOfLines = 0

        return cell
    }


    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
