import UIKit

class GeminiViewController: UIViewController {
    
    var geminiDtl = GeminiViewModel()
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var geminiTbl: UITableView!
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        geminiTbl.rowHeight = UITableView.automaticDimension
        geminiTbl.estimatedRowHeight = 72
        
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
        
        // Clean the text to remove unnecessary prefixes
        let cleanedText = conversationText.replacingOccurrences(of: "User: ", with: "").replacingOccurrences(of: "AI: ", with: "")
        
        cell.geminiOne?.text = cleanedText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Alternate text alignment between user and AI
        if indexPath.row % 2 == 0 {
            cell.geminiOne.textAlignment = .left
        } else {
            cell.geminiOne.textAlignment = .right
        }
        cell.geminiOne?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
