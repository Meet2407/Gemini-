//
//  ApiManger.swift
//  Gemini
//
//  Created by Meet Kapadiya on 12/09/24.
//

import Alamofire
import Foundation

class ApiManger{
    static let apiManager = ApiManger()
    
    
    func geminiAPI(search:String,success: @escaping(GeminiModel)-> (Void) ,failure: @escaping(Error)->(Void))
    {
        let url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyD0-o8iJXdtiEQmwyaQfO5w3I_FWwSsngY"
        
        // Define the headers
        let headers: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        // Define the parameters (the request body)
        let parameters:[String:Any]=[
            "contents": [
                    [
                        "parts": [
                            [
                                "text": "\(search)"
                            ]
                        ]
                    ]
                ]
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseData { response in
                switch response.result{
                case .success(let data):
                    do{
                        let decoder = JSONDecoder()
                        let responceData = try decoder.decode(GeminiModel.self, from: data)
                        success(responceData)
                    }catch{
                        failure(error)
                    }
            case .failure(let error):
                    failure(error)
            }
        }
    }
}
