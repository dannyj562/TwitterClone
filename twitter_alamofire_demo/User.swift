//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Danny on 10/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation
class User {
    var name: String?
    var screenName: String?
    var dictionary: [String:Any]?
    
    private static var tempCurrentUser: User?
    static var current: User? {
        
        get {
            if tempCurrentUser == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    tempCurrentUser = User(dictionary: dictionary)
                }
            }
            return tempCurrentUser
        }
        
        
        set (user) {
            tempCurrentUser = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
        
        
    }
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        self.dictionary = dictionary
    }
}
