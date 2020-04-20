//
//  SingleAvatorDataModel.swift
//  Access App Exercise
//
//  Created by LaurenceMini on 2020/4/20.
//  Copyright © 2020 LaurenceMini. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SingleAvatorDataModel {
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
    let name: String
    let company: String?
    let blog: String
    let location, email, hireable: String?
    let bio: String
    let publicRepos, publicGists, followers, following: Int
    let createdAt, updatedAt: String
    
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
        self.name = json["name"].stringValue
        self.company = json["company"].stringValue
        self.blog = json["blog"].stringValue
        self.location = json["location"].stringValue
        self.email = json["email"].stringValue
        self.hireable = json["hireable"].stringValue
        self.bio = json["bio"].stringValue
        self.publicRepos = json["public_repos"].intValue
        self.publicGists = json["public_gists"].intValue
        self.followers = json["followers"].intValue
        self.following = json["following"].intValue
        self.createdAt = json["created_at"].stringValue
        self.updatedAt = json["updated_at"].stringValue
        
    }
    
    
}
