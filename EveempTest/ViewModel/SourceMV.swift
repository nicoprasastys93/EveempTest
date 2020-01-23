//
//  SourceMV.swift
//  EveempTest
//
//  Created by Nico Prasasty S on 20/01/20.
//  Copyright © 2020 Nico Prasasty Sembiring. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class SourceMV {
    let source = Source()
    
    var sourceCount: Int{
        get{
            return items.count
        }
    }
    
    var items: [Source] = [Source]()
    
    func postSource(category: String, handler: @escaping (Bool) -> ()){
        _ = NewsAPI.shared.requestURLHtppBodyWithJSONRespons(baseURL: NewsAPI.baseURLSource, myurl: "sources?apiKey=\(NewsAPI.apiKey)&category=\(category)", params: [:]) { (success, data) in
            do{
                let json = try JSON(data: data)
                let articles = json["sources"].arrayValue
                
                for article in articles{
                    let item = Source()
                    item.id = article["id"].stringValue
                    item.id = article["name"].stringValue
                    item.id = article["description"].stringValue
                    item.id = article["url"].stringValue
                    item.id = article["category"].stringValue
                    item.id = article["language"].stringValue
                    item.id = article["country"].stringValue
                    
                    self.items.append(item)
                }
                
                
                print(articles)
                handler(true)
            }catch{
                
            }
        }
    }
}
