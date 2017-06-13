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
    public var expires_in: NSInteger?
    public var remind_in: String?
    public var uid: String?
    public var token: String?
    
    
    func saveToken(token: String) -> Void {
        self.token = token
    }
    
    func saveInfo(dict: [String: Any]) {
        
        acessToken = dict["access_token"] as? String
        expires_in = dict["expires_in"] as? NSInteger
        remind_in = dict["remind_in"] as? String
        uid = dict["uid"] as? String
        
    }
    
    func saveInfoToLocal(dict: [String: Any]) {
        
        UserDefaults.standard.set(dict["access_token"] as? String, forKey: "access_token")
        UserDefaults.standard.set(dict["remind_in"] as? String, forKey: "remind_in")
        UserDefaults.standard.set(dict["uid"] as? String, forKey: "uid")
        UserDefaults.standard.set(dict["expires_in"] as? NSInteger, forKey: "expires_in")
        UserDefaults.standard.synchronize()
        
    }
    
}
