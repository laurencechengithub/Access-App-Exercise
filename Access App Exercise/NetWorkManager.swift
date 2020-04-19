//
//  NetWorkManager.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import Foundation
import Alamofire
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
    
    
    private func baseRequest(url:String,
                     method:HTTPMethod = .get,
                     parameters:Parameters? = nil,
                     encoding:ParameterEncoding = URLEncoding.default,
                     headers: HTTPHeaders? = nil,
                     completionHandler:@escaping (_ responseJSON: JSON?) -> ()) -> DataRequest {

        return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { [weak self] (responseData) in
            
            switch responseData.result {
            case .success(let value):
                let jsonData = JSON(value)
                completionHandler(jsonData)
            case .failure(let error):
                print(" baseRequest error : \(error)")
                completionHandler(nil)
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
                print(theData)
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
        
//        guard let url = URL(string: apiDomain.gitGeneral.url) else {
//            return
//        }

//        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//            guard let theData = data else {
//                print("RequestManager getCurrecyRate : data is nil")
//                return
//            }
//
//            do {
//               let modelData = try JSONDecoder().decode(GetAllUserDataModel.self, from: theData)
//                completeHander(modelData)
//            } catch {
//
//                let showError = error
//                print(" getCurrecyRate error : \(showError)")
//            }
//        }.resume()
        
        
    }
    
    
    
    
    
}
