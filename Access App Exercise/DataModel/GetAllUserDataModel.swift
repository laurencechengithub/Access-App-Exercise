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
        self.nodeID = json["node_id"].stringValue
        self.avatarURL = json["avatar_url"].stringValue
        self.gravatarID = json["gravatar_id"].stringValue
        self.url = json["url"].stringValue
        self.htmlURL = json["html_url"].stringValue
        self.followersURL = json["followers_url"].stringValue
        self.followingURL = json["following_url"].stringValue
        self.gistsURL = json["gists_url"].stringValue
        self.starredURL = json["starred_url"].stringValue
        self.subscriptionsURL = json["subscriptions_url"].stringValue
        self.organizationsURL = json["organizations_url"].stringValue
        self.reposURL = json["repos_url"].stringValue
        self.eventsURL = json["events_url"].stringValue
        self.receivedEventsURL = json["received_events_url"].stringValue
        self.type = json["type"].stringValue
        self.siteAdmin = json["site_admin"].boolValue

    }
    
}
