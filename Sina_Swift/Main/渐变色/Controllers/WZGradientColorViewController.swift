//
//  WZGradientColorViewController.swift
//  Sina_Swift
//
//  Created by neoby on 2018/5/4.
//  Copyright © 2018年 Arther. All rights reserved.
//

import UIKit

class WZGradientColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "渐变色"
        
        let gradientColorView = WZGradientColorView(frame: view.bounds)
        view.addSubview(gradientColorView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
