//
//  WZViewController.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/14.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let array: Array<String> = ["微博列表","渐变色","测试cell刷新"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "列表"
        self.view.backgroundColor = UIColor.white
//        tableView.separatorStyle = .none
        tableView.rowHeight = 50
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sbCell")
        if let labelName = cell?.viewWithTag(100) as? UILabel {
            labelName.text = array[indexPath.row]
        }
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            BYLoadingTool.shared.showHud(in: self.view)
            if (UserDefaults.standard.object(forKey: "access_token") != nil) {
                BYNetRequest.shared.lookAccessTokenOld(access_token: (UserDefaults.standard.object(forKey: "access_token") as? String)!, SuccessBlock: { (dict) in
                    if dict["error"] != nil {
                        self.navigationController?.pushViewController(WZLoginViewController(), animated: true)
                        BYLoadingTool.shared.hideHud()
                    } else {
                        let dict:[String : Any] = [   "access_token" : UserDefaults.standard.object(forKey: "access_token") ?? "",
                                                      "expires_in"   : UserDefaults.standard.object(forKey: "expires_in") ?? "",
                                                      "remind_in"    : UserDefaults.standard.object(forKey: "remind_in") ?? "",
                                                      "uid"          : UserDefaults.standard.object(forKey: "uid") ?? ""
                                                   ]
                        WZUserAcessToken.shared.saveInfo(dict: dict)
                        self.navigationController?.pushViewController(WZHomeViewController(), animated: true)
                        BYLoadingTool.shared.hideHud()
                    }
                }) { (error) in
                    print(error)
                    BYLoadingTool.shared.hideHud()
                }
            } else {
                self.navigationController?.pushViewController(WZLoginViewController(), animated: true)
                BYLoadingTool.shared.hideHud()
            }
        case 1:
            navigationController?.pushViewController(WZGradientColorViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(WZTestCellReloadViewController(), animated: true)
        default:
            print("没有找到方法")
        }
    }
    
}
