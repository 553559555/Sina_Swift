//
//  BYUserInfo.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/5/12.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class BYUserInfo: NSObject {
    
    static let shared = BYUserInfo()
    public var token: String?
    public var bankCardCount: String?
    public var certNo: String?
    public var certStatus: String?
    public var createAccountFlag: String?
    public var custCateGory: String?
    public var customerId: String?
    public var email: String?
    public var name: String?
    public var neybyCardCount: String?
    public var payPasswordStatus: String?
    public var phone: String?
    public var starStatus: String?
    public var status: String?
    public var wanNengBao: String?
    
    func saveToken(token: String) -> Void {
        self.token = token
    }
    
    func saveUserInfo(dict: [String: Any]) -> Void {
        self.bankCardCount = dict["bankCardCount"] as? String
        self.certNo = dict["certNo"] as? String
        self.certStatus = dict["certStatus"] as? String
        self.createAccountFlag = dict["createAccountFlag"] as? String
        self.custCateGory = dict["custCateGory"] as? String
        self.customerId = dict["customerId"] as? String
        self.email = dict["email"] as? String
        self.name = dict["name"] as? String
        self.neybyCardCount = dict["neybyCardCount"] as? String
        self.payPasswordStatus = dict["payPasswordStatus"] as? String
        self.phone = dict["phone"] as? String
        self.starStatus = dict["starStatus"] as? String
        self.status = dict["status"] as? String
        self.wanNengBao = dict["wanNengBao"] as? String
    }
    
    func userExit() {
        self.bankCardCount = ""
        self.certNo = ""
        self.certStatus = ""
        self.createAccountFlag = ""
        self.custCateGory = ""
        self.customerId = ""
        self.email = ""
        self.name = ""
        self.neybyCardCount = ""
        self.payPasswordStatus = ""
        self.phone = ""
        self.starStatus = ""
        self.status = ""
        self.wanNengBao = ""
    }
    
}
