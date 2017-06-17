//
//  Common.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/4/28.
//  Copyright © 2017年 Arther. All rights reserved.
//

import Foundation
import UIKit

//获取屏幕比例
let WIDTH_RATIO = (UIScreen.main.bounds.width / 750.0)
let HEIGHT_RATIO = (UIScreen.main.bounds.height / 1334.0)

//当前屏幕宽高
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let GET_USER_TOKEN = "https://api.weibo.com/oauth2/authorize"
let GET_ACCESS_TOKEN = "https://api.weibo.com/oauth2/access_token"
let GET_NEW_LAST = "https://api.weibo.com/2/statuses/home_timeline.json"

let APPKEY = "3356906810"
let REDIRECT_URL = "http://www.baidu.com"
let APP_SECRET = "f30501fded29138e7fc79d21c394feea"




//颜色
let LINECOLOR = UIColor.colorWithHexString(hex: "e0e0e0")
let BACKGROUNDCOLOR = UIColor.colorWithHexString(hex: "f0f0f0")

