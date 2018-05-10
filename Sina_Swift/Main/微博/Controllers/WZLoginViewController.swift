//
//  WZLoginViewController.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/8.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZLoginViewController: UIViewController,UIWebViewDelegate {
    
    private var webView: UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addChildViews()
        initNav()
    }
    
    private func addChildViews() {
        webView = UIWebView(frame: self.view.bounds);
        webView?.loadRequest(NSURLRequest(url: NSURL(string: "\(GET_USER_TOKEN)?client_id=\(APPKEY)&redirect_uri=\(REDIRECT_URL)")! as URL) as URLRequest)
        webView?.delegate = self
        self.view.addSubview(webView!)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.url?.absoluteString
        if url?.components(separatedBy: "http://www.baidu.com/?code=").count == 2 {
            let array = url?.components(separatedBy: "http://www.baidu.com/?code=")
            WZUserAcessToken.shared.saveToken(token: (array?[1])!)
            BYNetRequest.shared.getAccessToken(code: WZUserAcessToken.shared.token!, SuccessBlock: { (dict) in
                WZUserAcessToken.shared.saveInfo(dict: dict)
                WZUserAcessToken.shared.saveInfoToLocal(dict: dict)
                self.navigationController?.pushViewController(WZHomeViewController(), animated: true)
            }, ErrorBlock: { (error) in
                print(error);
            })
        }
        return true
    }
    
    private func initNav() {
        self.title = "授权"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
