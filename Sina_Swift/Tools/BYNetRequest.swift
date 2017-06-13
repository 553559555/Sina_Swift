//
//  BYNetRequest.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/5/12.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class BYNetRequest: NSObject {
    
    static let shared = BYNetRequest()

    /**
     * 授权获取Token
     * client_id    : APPKEY
     * redirect_uri : 回调地址
     */
    public func getLoginWithToken(client_id: String, redirect_uri: String ,SuccessBlock:@escaping ((_ success :[String: Any])->Void),ErrorBlock:@escaping ((_ error: HTTPURLResponse)->Void)) {
        
        let parameter = ["client_id": client_id, "redirect_uri": redirect_uri]
        
        Alamofire.request("\(GET_USER_TOKEN)", method: .get, parameters: parameter).responseJSON { response in
            if let JSON = response.result.value {
                let a = JSON as? [String: Any]
                SuccessBlock(a!)
            } else {
                BYLoadingTool.shared.showText(str: "网络请求超时", currentView: ((UIApplication.shared.delegate?.window)!)!)
                if let error = response.response {
                    ErrorBlock(error)
                }
                
            }
        }
    }
    
    /**
     * 获取用户 access_Token
     * client_id    : APPKEY
     * client_secret : AppSecret
     * grant_type : token
     */
    
    public func getAccessToken(code: String, SuccessBlock:@escaping ((_ success :[String: Any])->Void),ErrorBlock:@escaping ((_ error: HTTPURLResponse)->Void)) {
        
        let parameter = ["client_id": APPKEY, "client_secret": APP_SECRET, "grant_tyoe": "authorization_code", "code": code, "redirect_uri": REDIRECT_URL];
        
        Alamofire.request("\(GET_ACCESS_TOKEN)", method: .post, parameters: parameter).responseJSON { response in
            if let JSON = response.result.value {
                let a = JSON as? [String: Any]
                SuccessBlock(a!)
            } else {
                BYLoadingTool.shared.showText(str: "网络请求超时", currentView: ((UIApplication.shared.delegate?.window)!)!)
                if let error = response.response {
                    ErrorBlock(error)
                }
                
            }
        }
    }
    
    public func getNewList(access_token: String, page: Int, SuccessBlock:@escaping ((_ success : [String : Any])-> Void), ErrorBlock:@escaping ((_ error : HTTPURLResponse)->Void)) {
        
        let paramter = ["access_token" : access_token, "count" : "\(10)", "page" : "\(page)"];
        
        Alamofire.request(GET_NEW_LAST, method: .get, parameters: paramter).responseJSON { response in
            if let JSON = response.result.value {
                let a = JSON as? [String: Any]
                SuccessBlock(a!)
            } else {
                BYLoadingTool.shared.showText(str: "网络请求超时", currentView: ((UIApplication.shared.delegate?.window)!)!)
                if let error = response.response {
                    ErrorBlock(error)
                }
                
            }
        }

        
    }
    
    
}
