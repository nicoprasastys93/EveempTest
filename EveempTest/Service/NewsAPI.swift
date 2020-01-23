//
//  NewsAPI.swift
//  EveempTest
//
//  Created by Nico Prasasty S on 20/01/20.
//  Copyright © 2020 Nico Prasasty Sembiring. All rights reserved.
//

import Foundation
import Alamofire


class NewsAPI: NSObject{
    static let shared = NewsAPI()
    static let baseURLSource: String = "https://newsapi.org/v2/"
    static let apiKey: String = "780db7058f004b9fa0d66536ec29811e"
    
    struct ServerError {
        let failedRespon = "Gagal mendapatkan respon dari server"
        let timeOut      = "Connection timed out"
    }
    
    let serverError = ServerError()
    
    public func requestURLHtppBodyWithJSONRespons(baseURL: String, myurl: String, params: Parameters, complition: @escaping(Bool, Data)-> ()) -> DataRequest{
        
        let url = baseURL + myurl
        
        
        let task = Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.httpBody, headers: nil)
    
        DispatchQueue.main.async {
            task.response(completionHandler: { (response) in
                var error = false
                var message = ""
                
                let result = String(data: response.data!, encoding: .utf8) ?? ""
                
                if response.response == nil{
                    error = true
                    message = self.serverError.failedRespon
                }
                else if response.response?.statusCode == 404{
                    error = true
                    message = self.serverError.failedRespon
                }
                else if response.response?.statusCode == 502{
                    error = true
                    message = self.serverError.timeOut
                }
                else if (result.contains("")) || (result.contains("")){
                    error = true
                    message = self.serverError.failedRespon
                }
                    
                print(response.error)
                print(response.request)
                if error{
                    complition(false, message.data(using: .utf8)!)
                }
                else{
                    complition(true, response.data!)
                }
                
            
            })
        }
        return task
    }
}
