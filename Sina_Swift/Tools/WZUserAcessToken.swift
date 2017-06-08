//
//  WZUserAcessToken.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/8.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZUserAcessToken: NSObject {

    static let shared = WZUserAcessToken()
    public var acessToken: String?
    public var expires_in: String?
    public var remind_in: String?
    public var uid: String?
    
    func saveInfo(dict: [String: Any]) {
        
        acessToken = dict["access_token"] as? String
        expires_in = dict["expires_in"] as? String
        remind_in = dict["remind_in"] as? String
        uid = dict["uid"] as? String
        
    }
    
}
