//
//  MainViewModel.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import Foundation


final class MainViewModel {
    
    var list: [GetAllUserDataModel]!
    
    
    func getInfoOfUsers(startFrom:Int, completeValue:()->()) {
        
        NetWorkManager.sharedInstance.getAllUser(since: startFrom) { (GetAllUserData) in
            
        }
        
    }
    
    
}
