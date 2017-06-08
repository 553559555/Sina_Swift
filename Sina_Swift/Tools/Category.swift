//
//  Category.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/4/28.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

/**  图片缩放  */
extension UIImage {
    
    class func scaleImage(image : UIImage) -> UIImage {
        
        let tempSize = CGSize(width: image.size.width / 3, height: image.size.height / 3)
        
        switch UIScreen.main.scale {
        case 2.0:
            UIGraphicsBeginImageContextWithOptions(tempSize, false, 0)
        case 3.0:
            UIGraphicsBeginImageContextWithOptions(tempSize, false, 0)
        default:
//            UIGraphicsBeginImageContext(tempSize)
            UIGraphicsBeginImageContextWithOptions(tempSize, false, 0)
        }
        
        image.draw(in: CGRect(x: 0, y: 0, width: tempSize.width, height: tempSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
}

/**  快速创建自定义barButton  */
extension UIBarButtonItem {
    
    class func backNavigtionItemButton(imageName: UIImage, Target: AnyObject, selectedFunc : Selector) -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 10 * WIDTH_RATIO, y: 24, width: 40 , height: 40))
        button.setImage(imageName, for: .normal)
        button.addTarget(Target, action: selectedFunc, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    
}

/**  颜色分类  */
extension UIColor {
    class func colorWithHexString(hex:String) ->UIColor {
        
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            let index = cString.index(cString.startIndex, offsetBy:1)
            cString = cString.substring(from: index)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.red
        }
        
        let rIndex = cString.index(cString.startIndex, offsetBy: 2)
        let rString = cString.substring(to: rIndex)
        let otherString = cString.substring(from: rIndex)
        let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let gString = otherString.substring(to: gIndex)
        let bIndex = cString.index(cString.endIndex, offsetBy: -2)
        let bString = cString.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
