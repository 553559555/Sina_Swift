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
        
        let gradientColorView = WZGradientColorView(frame: CGRect(x: 0, y: 80, width: self.view.bounds.size.width, height: 50))
        view.addSubview(gradientColorView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
