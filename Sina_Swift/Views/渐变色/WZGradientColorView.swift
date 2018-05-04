//
//  WZGradientColorView.swift
//  Sina_Swift
//
//  Created by neoby on 2018/5/4.
//  Copyright © 2018年 Arther. All rights reserved.
//

import UIKit

class WZGradientColorView: UIView {

    override open class var layerClass: Swift.AnyClass {
        return HueGradientColorLayer.self
    }

}

class HueGradientColorLayer: CAGradientLayer {
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        var controns = [CGFloat]()
        controns = Array(stride(from: 0, through: 1, by: 0.01))
        locations = controns as [NSNumber]?
        colors = controns.map {
            UIColor(hue: $0, saturation: 1, brightness: 1, alpha: 1).cgColor
        }
        startPoint = CGPoint(x: 0, y: 0.5)
        endPoint = CGPoint(x: 1, y: 0.5)
    }
}
