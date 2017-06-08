//
//  BYLoadingTool.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/5/19.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import MBProgressHUD

class BYLoadingTool: NSObject {
    
    static let shared = BYLoadingTool()

    private var HUD: MBProgressHUD?
    
    // MARK: - 提示文本
    func showText(str: String, currentView: UIView) {
        
        HUD = MBProgressHUD.showAdded(to: currentView, animated: true)
        HUD?.animationType = .zoomOut
        HUD?.bezelView.color = UIColor.black
        HUD?.contentColor = UIColor.white
        HUD?.mode = .text
        HUD?.label.text = str
        HUD?.isUserInteractionEnabled = false
        HUD?.removeFromSuperViewOnHide = false
        HUD?.hide(animated: true, afterDelay: 1)
        
    }
    
    // MARK: - 加载中
    func showHud(in view: UIView, str: String = "加载中..."){

        HUD = MBProgressHUD.showAdded(to: view, animated: true)
        HUD?.label.text = str
        HUD?.label.font = UIFont.systemFont(ofSize: 15)
        //设为false后点击屏幕其他地方有反应
        HUD?.isUserInteractionEnabled = true
        //HUD内的内容的颜色
        HUD?.contentColor = UIColor.white
        //View的颜色
        HUD?.bezelView.color = UIColor(white: 0, alpha: 0.6)
        //style -blur 不透明 －solidColor 透明
        HUD?.bezelView.style = .solidColor
        HUD?.backgroundColor = UIColor(white: 0, alpha: 0.3)

    }
    
    // MARK: - 移除
    func hideHud() {
        //如果解包成功则移除，否则不做任何事
        if let hud = HUD {
            hud.hide(animated: true)
        }
    }
    
    deinit {
        print("没有循环引用")
    }
    
}
