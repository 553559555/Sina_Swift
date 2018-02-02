//
//  WZBrowseImageViewController.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/13.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import Kingfisher

class WZBrowseImageViewController: UIViewController, UIScrollViewDelegate {
    
    private var scrollView : UIScrollView?
    public var imageArray : [[String : Any]]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        addChildViews()
        addChildLayout()
    }
    
    private func addChildViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(WZBrowseImageViewController.dismissCurrentVC))
        scrollView = UIScrollView()
        scrollView?.delegate = self
        scrollView?.isPagingEnabled = true
        view.addSubview(scrollView!)
        scrollView?.addGestureRecognizer(tap)
        scrollView?.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat((imageArray?.count)!), height: 0)
        for i in 0 ..< (imageArray?.count)! {
            let image = UIImageView(frame: CGRect(x: SCREEN_WIDTH * CGFloat(i), y: (SCREEN_HEIGHT - 200) / 2, width: SCREEN_WIDTH, height: 200))
            let tempDict = self.imageArray?[i]
            image.kf.setImage(with: URL(string: (tempDict?["thumbnail_pic"] as? String)!))
            scrollView?.addSubview(image)
        }
        
    }


    
    func dismissCurrentVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func addChildLayout() {
        scrollView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.view)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
