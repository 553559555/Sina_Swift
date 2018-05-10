//
//  WZPicCollectionView.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/13.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZPicCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    static let identifier = "collectionviewCell"
    private var flowLayout : UICollectionViewFlowLayout?
    private let margin = 5 * WIDTH_RATIO
    private let tempWidth = SCREEN_WIDTH - 30 * WIDTH_RATIO
    public var picArray: [[String: Any]]? {
        didSet {
            switch picArray?.count {
            case 1?:
                flowLayout?.itemSize = CGSize(width: 300 * WIDTH_RATIO, height: 400 * HEIGHT_RATIO)
            case 2?:
                flowLayout?.itemSize = CGSize(width: (tempWidth - 2 * margin) / 2, height: 400 * HEIGHT_RATIO)
            default:
                flowLayout?.itemSize = CGSize(width: (tempWidth - 3 * margin) / 3, height: (tempWidth - 3 * margin) / 3)
            }
            self.reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout?.minimumLineSpacing = margin
        flowLayout?.minimumInteritemSpacing = margin
        super.init(frame: frame, collectionViewLayout: flowLayout!)
        self.isScrollEnabled = false
        self.delegate = self
        self.dataSource = self
        self.register(WZPicCell.classForCoder(), forCellWithReuseIdentifier: WZPicCollectionView.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "PushBrowseImageVC"), object: picArray)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.picArray?.count != nil ? (self.picArray?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WZPicCollectionView.identifier, for: indexPath) as? WZPicCell
        let tempDict = self.picArray?[indexPath.item]
        cell?.url = tempDict?["thumbnail_pic"] as? String
        return cell!
    }

}
