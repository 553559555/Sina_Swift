//
//  WZHomeModel.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/12.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZHomeModel: NSObject {
    
    public var name: String?
    public var icon: String?
    public var time: String?
    public var from: String?
    public var text: String?
    public var pic: [[String: Any]]?
    public var transmitText: String?
    public var isTransmit: Bool?

    required init(dict: [String: Any]) {
        super.init()
        
        let userInfo = dict["user"] as? [String: Any]
        name = userInfo?["name"] as? String
        icon = userInfo?["avatar_large"] as? String
        time = dict["created_at"] as? String
        text = dict["text"] as? String
        isTransmit = (dict["retweeted_status"] != nil) ? true : false
        if isTransmit! {
            let transmitInfo = dict["retweeted_status"] as? [String: Any]
            pic = transmitInfo?["pic_urls"] as? [[String: Any]]
            transmitText = transmitInfo?["text"] as? String
        } else {
            pic = dict["pic_urls"] as? [[String: Any]]
            transmitText = ""
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
