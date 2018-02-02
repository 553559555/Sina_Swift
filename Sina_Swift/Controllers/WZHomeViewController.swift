//
//  WZHomeViewController.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/8.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import MJRefresh

class WZHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var page: Int?
    private var tableView: UITableView?
    private var dataArray = [WZHomeModel]()
    
    
    static let identifier = "tableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initNav()
        page = 0
        addChildViews()
        self.getNewData()
        
    }
    
    func PushBrowseImageVC(notification: Notification) {
        print(notification)
        let browseImageVC = WZBrowseImageViewController()
        browseImageVC.imageArray = notification.object as? [[String:Any]]
        self.present(browseImageVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: WZHomeViewController.identifier) as? WZTableViewCell
        let textHeight = cell?.heightWithModel(model: (self.dataArray[indexPath.row]))
        return 120 * HEIGHT_RATIO + textHeight!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = WZTableViewCell()
        cell.model = self.dataArray[indexPath.row]
        return cell
        
    }
    
    @objc private func getNewData() {
        page = 1;
        BYNetRequest.shared.getNewList(access_token: WZUserAcessToken.shared.acessToken!, page: page!, SuccessBlock: { (dict) in
            self.dataArray.removeAll()
            let array = dict["statuses"] as? [[String : Any]]
            var tempArray = [WZHomeModel]()
            for (_,value) in (array?.enumerated())! {
                let model = WZHomeModel(dict: value)
                tempArray.append(model)
            }
            print("tempArray = %tu", tempArray.count);
            print("dataArray = %tu", self.dataArray.count);
            self.dataArray += tempArray
            print("dataArray = %tu", self.dataArray.count);
            self.tableView?.reloadData()
            self.tableView?.mj_header.endRefreshing()
        }) { (error) in
            print(error)
            
        }
    }
    
    @objc private func getListData() {
        page = page! + 1
        BYNetRequest.shared.getNewList(access_token: WZUserAcessToken.shared.acessToken!, page: page!, SuccessBlock: { (dict) in
            let array = dict["statuses"] as? [[String : Any]]
            var tempArray = [WZHomeModel]()
            for (_,value) in (array?.enumerated())! {
                let model = WZHomeModel(dict: value)
                tempArray.append(model)
            }
            print("tempArray = %tu", tempArray.count);
            print("dataArray = %tu", self.dataArray.count);
            self.dataArray += tempArray
            print("dataArray = %tu", self.dataArray.count);
            self.tableView?.reloadData()
            self.tableView?.mj_footer.endRefreshing()

        }) { (error) in
            print(error)
            self.page = self.page! - 1
        }
    }
    
    private func addChildViews() {
        tableView = UITableView()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.estimatedRowHeight = 0;
        tableView?.estimatedSectionHeaderHeight = 0;
        tableView?.estimatedSectionFooterHeight = 0;
        view.addSubview(tableView!)
        tableView?.register(WZTableViewCell.classForCoder(), forCellReuseIdentifier: WZHomeViewController.identifier)
        tableView?.snp.makeConstraints({ (make) in
            make.left.right.bottom.top.equalTo(self.view!)
        })
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
            tableView?.contentInset = UIEdgeInsetsMake(CGFloat(NAVIGATION_HEIGHT), 0, 0, 0)
            tableView?.scrollIndicatorInsets = (tableView?.contentInset)!
        }
        tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(WZHomeViewController.getNewData))
        tableView?.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(WZHomeViewController.getListData))
        NotificationCenter.default.addObserver(self, selector: #selector(WZHomeViewController.PushBrowseImageVC), name: NSNotification.Name(rawValue: "PushBrowseImageVC"), object: nil)
    }
    
    private func initNav() {
        self.title = "首页"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
