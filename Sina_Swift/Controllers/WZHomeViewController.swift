//
//  WZHomeViewController.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/8.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(BYUserInfo.shared.token!)
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
