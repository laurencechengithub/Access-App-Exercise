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
                    return "https://api.github.com/"
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
    
    
    func getAllUser(since:Int, completeHander: @escaping(GetAllUserDataModel?)->()) {
        let param = ["since":since]
        
        baseRequest(url: "\(apiDomain.gitGeneral.url)", method: .get, parameters: param) { (data) in
            guard let jsonData = data else {
                   completeHander(nil)
                   return
            }
            completeHander(GetAllUserDataModel(fromJson: jsonData))
        }
    }
    
}
