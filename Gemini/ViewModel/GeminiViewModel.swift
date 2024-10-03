import Foundation
import Alamofire

class GeminiViewModel {
  
    var arrGemini: GeminiModel?
    var ans: String?
    var allData: [String] = []
    
    func geminiDataFatch(inputText: String, success: @escaping () -> Void, failure: @escaping (Error) -> Void) {
        ApiManger.apiManager.geminiAPI(search: inputText, success: { [self] data in
            
            self.ans = data.candidates[0].content.parts[0].text
            
            if let aiResponse = self.ans {
                self.allData.append("AI:\n \(aiResponse)")
            }
            
            success()
        }, failure: { error in
            failure(error)
        })
    }
}
