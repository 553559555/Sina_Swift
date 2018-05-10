//
//  WZTestCellReloadViewController.swift
//  Sina_Swift
//
//  Created by neoby on 2018/5/9.
//  Copyright © 2018年 Arther. All rights reserved.
//

import UIKit

class WZTestCellReloadViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WZTestCell.classForCoder(), forCellReuseIdentifier: "testCell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell")
        cell?.textLabel?.text = "\(indexPath.row)"
        cell?.selectionStyle = .none
        return cell!
    }

}
