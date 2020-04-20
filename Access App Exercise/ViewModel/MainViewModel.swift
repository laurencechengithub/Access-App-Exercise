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
    var avatarDetail: SingleAvatorDataModel?
    
    func getInfoOfUsers(startFrom:Int, isCompleteTask: @escaping (Bool)->()) {
        
        NetWorkManager.sharedInstance.getAllUser(since: startFrom) { (GetAllUserDataArray) in
            
            guard let array = GetAllUserDataArray else {
                isCompleteTask(false)
                return
            }
            self.list = array
            isCompleteTask(true)
            
        }
        
    }
    
    func getSingleUserWith(loginName:String, isCompleteTask: @escaping (Bool)->()) {
        
        NetWorkManager.sharedInstance.getSingleUserWith(loginName: loginName) { (SingleAvatorDataModel) in
            
            guard let avatar = SingleAvatorDataModel else {
                isCompleteTask(false)
                return
            }
            self.avatarDetail = avatar
            isCompleteTask(true)
        }
        
    }
    
    
    
    
}
