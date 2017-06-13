//
//  WZHomeViewController.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/8.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var page: Int?
    private var tableView: UITableView?
    private var dataArray: [WZHomeModel]?
    
    
    static let identifier = "tableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initNav()
        page = 0
        getListData()
        tableView = UITableView()
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.register(WZTableViewCell.classForCoder(), forCellReuseIdentifier: WZHomeViewController.identifier)
        tableView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.top.equalTo(self.view!)
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(WZHomeViewController.PushBrowseImageVC), name: NSNotification.Name(rawValue: "PushBrowseImageVC"), object: nil)
    }
    
    func PushBrowseImageVC(notification: Notification) {
        print(notification)
        let browseImageVC = WZBrowseImageViewController()
        browseImageVC.imageArray = notification.object as? [[String:Any]]
        self.present(browseImageVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: WZHomeViewController.identifier) as? WZTableViewCell
        let textHeight = cell?.heightWithModel(model: (self.dataArray?[indexPath.row])!)
        return 120 * HEIGHT_RATIO + textHeight!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataArray?.count != nil) ? (self.dataArray?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = WZTableViewCell()
        cell.model = self.dataArray?[indexPath.row]
        return cell
        
    }
    
    private func getListData() {
        page = page! + 1
        BYNetRequest.shared.getNewList(access_token: WZUserAcessToken.shared.acessToken!, page: page!, SuccessBlock: { (dict) in
            let array = dict["statuses"] as? [[String : Any]]
            var tempArray = [WZHomeModel]()
            for (_,value) in (array?.enumerated())! {
                let model = WZHomeModel(dict: value)
                tempArray.append(model)
            }
            self.dataArray = tempArray
            self.tableView?.reloadData()

        }) { (error) in
            print(error)
        }
    }
    
    private func initNav() {
        self.title = "首页"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
