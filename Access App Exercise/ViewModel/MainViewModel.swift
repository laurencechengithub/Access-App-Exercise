//
//  MainViewModel.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import Foundation


final class MainViewModel {
    
    var list: [GetAllUserData]?
    
    
    func getInfoOfUsers(startFrom:Int, respondBool: @escaping (Bool)->()) {
        
        NetWorkManager.sharedInstance.getAllUser(since: startFrom) { (GetAllUserDataArray) in
            
            guard let array = GetAllUserDataArray else {
                respondBool(false)
                return
            }
            self.list = array
            respondBool(true)
            
        }
        
    }
    
    
}
