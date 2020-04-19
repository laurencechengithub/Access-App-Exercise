//
//  getAllUserDataModel.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/19.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GetAllUserDataModel {
    var dataArray: [GetAllUserData]
    
    init(fromJson json:JSON) {
        
        self.dataArray = json.arrayValue.map({
            GetAllUserData(fromJson: $0)
        })
        
    }
    
}


struct GetAllUserData {
    
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    
    
    init(fromJson json:JSON) {
        self.login = json["login"].stringValue
        self.id = json["id"].intValue
        self.nodeID = json["nodeID"].stringValue
        self.avatarURL = json["avatarURL"].stringValue
        self.gravatarID = json["gravatarID"].stringValue
        self.url = json["url"].stringValue
        self.htmlURL = json["htmlURL"].stringValue
        self.followersURL = json["followersURL"].stringValue
        self.followingURL = json["followingURL"].stringValue
        self.gistsURL = json["gistsURL"].stringValue
        self.starredURL = json["starredURL"].stringValue
        self.subscriptionsURL = json["subscriptionsURL"].stringValue
        self.organizationsURL = json["organizationsURL"].stringValue
        self.reposURL = json["reposURL"].stringValue
        self.eventsURL = json["eventsURL"].stringValue
        self.receivedEventsURL = json["receivedEventsURL"].stringValue
        self.type = json["type"].stringValue
        self.siteAdmin = json["siteAdmin"].boolValue

    }
    
}
