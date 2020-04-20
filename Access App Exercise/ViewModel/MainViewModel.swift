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
    var avatarDetailVM:AvatarDetailViewModel!
    var isNeededToGetMoreUsers = true
    var isFetching = false
    var users = 0
    var page = 0 {
        didSet {
            if users < 100 {
                users += 20
                print("users : \(users)")
            }
        }
    }
    
    func getInfoOfUsers(startFromId:Int, isCompleteTask: @escaping (Bool)->()) {
        
        if isFetching == false {
            print("isFetching == false")
            print("page: \(page)")
            if page < 5 {
                page += 1
                isNeededToGetMoreUsers = true
            } else {
                isNeededToGetMoreUsers = false
            }
        } else if isFetching == true {
            isNeededToGetMoreUsers = false
        }
        
        print("isNeededToGetMoreUsers : \(isNeededToGetMoreUsers)")
        
        if isNeededToGetMoreUsers == true {
            
            self.isFetching = true
            
            NetWorkManager.sharedInstance.getAllUser(since: startFromId, users: self.users) { (GetAllUserDataArray) in
                
                guard let array = GetAllUserDataArray else {
                    isCompleteTask(false)
                    return
                }
                self.list = array
                isCompleteTask(true)
                
            }
            
        }
        
        
        

        
    }
    
    func getSingleUserWith(loginName:String, isCompleteTask: @escaping (Bool)->()) {
        
        NetWorkManager.sharedInstance.getSingleUserWith(loginName: loginName) { (SingleAvatorDataModel) in
            
            guard let avatar = SingleAvatorDataModel else {
                isCompleteTask(false)
                return
            }
            self.avatarDetailVM = AvatarDetailViewModel(singleAvatorDataModel: avatar)
            isCompleteTask(true)
        }
        
    }
    
    
    
    
}
