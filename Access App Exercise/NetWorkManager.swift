//
//  NetWorkManager.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import Foundation
import SwiftyJSON

class NetWorkManager {

    static var sharedInstance = NetWorkManager()
    private init() {}
    
    enum apiDomain {
        case gitGeneral
        
        var url:String {
            get {
                switch self {
                case .gitGeneral:
                    return "https://api.github.com/users"
                }
            }
        }
    }
    
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask:URLSessionTask?
    
    func getAllUser(since:Int, completeHander: @escaping([GetAllUserData]?)->()) {

        self.dataTask?.cancel()
        
        guard var urlComponent = URLComponents(string: apiDomain.gitGeneral.url) else {
              return
        }
        
        urlComponent.query = "since=1&page=1&per_page=20"
        
        guard let url = urlComponent.url else {
            return
        }
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                print("error message : \(error)")
            } else if let theData = data, let theResponce = response as? HTTPURLResponse {
                if theResponce.statusCode == 200 {
                    
                    let jsonData = JSON(theData)
                    let result = GetAllUserDataModel(fromJson: jsonData)
                    
                    completeHander(result.dataArray)
                } else {
                    completeHander(nil)
                }
            }
            
        })
        
        dataTask?.resume()
    }
    
    func getSingleUserWith(loginName:String, completeHander: @escaping(SingleAvatorDataModel?)->()) {
        
        self.dataTask?.cancel()
        
        guard var urlComponent = URLComponents(string: "\(apiDomain.gitGeneral.url)/\(loginName)") else {
                 return
           }
        
        guard let url = urlComponent.url else {
               return
           }
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                print("error message : \(error)")
            } else if let theData = data, let theResponce = response as? HTTPURLResponse {
                
                if theResponce.statusCode == 200 {
                    
                    let jsonData = JSON(theData)
                    let result = SingleAvatorDataModel(fromJson: jsonData)
                    
                    completeHander(result)
                } else {
                    
                }
            }
            
            
        })
        
        dataTask?.resume()
    }
}
