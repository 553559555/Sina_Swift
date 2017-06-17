//
//  WZTableViewCell.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/12.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZTableViewCell: UITableViewCell {
    
    private var transmitView: WZTransmitView?
    private var userInfo : WZUserInfoView?
    private var picView : WZPicCollectionView?
    private var flowLayout : UICollectionViewFlowLayout?
    private var tempHeight : CGFloat?
    private let tempWidth = SCREEN_WIDTH - 30 * WIDTH_RATIO
    private let margin = 5 * WIDTH_RATIO
    
    public var model : WZHomeModel? {
        didSet{
            userInfo?.model = model
            if (model?.isTransmit)! {
                picView?.isHidden = true
                transmitView?.model = model
                let TextHeight = model?.transmitText!.boundingRect(with: CGSize(width: SCREEN_WIDTH - 30 * WIDTH_RATIO, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.height
                
                transmitView?.snp.updateConstraints({ (make) in
                    if ((model?.pic?.count) != nil) {
                        switch model?.pic?.count {
                        case 1?:
                            make.height.equalTo(400 * HEIGHT_RATIO + TextHeight! + 25 * HEIGHT_RATIO)
                        case 2?:
                            make.height.equalTo(400 * HEIGHT_RATIO + TextHeight! + 25 * HEIGHT_RATIO)
                        default:
                            let count = (model?.pic?.count)! % 3
                            let temp = count == 0 ? 0 : 1
                            make.height.equalTo((tempWidth / 3) * CGFloat((model?.pic?.count)! / 3 + temp) + TextHeight! + 25 * HEIGHT_RATIO)
                        }
                    }
                })
                self.contentView.layoutIfNeeded()
                picView?.picArray = model?.pic
            } else {
                transmitView?.isHidden = true
                picView?.snp.updateConstraints({ (make) in
                    if ((model?.pic?.count) != nil) {
                        switch model?.pic?.count {
                        case 1?:
                            make.height.equalTo(400 * HEIGHT_RATIO)
                        case 2?:
                            make.height.equalTo(400 * HEIGHT_RATIO)
                        default:
                            let count = (model?.pic?.count)! % 3
                            let temp = count == 0 ? 0 : 1
                            make.height.equalTo((tempWidth / 3) * CGFloat((model?.pic?.count)! / 3 + temp))
                        }
                    }
                })
                self.contentView.layoutIfNeeded()
                picView?.picArray = model?.pic
            }
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addChildViews()
        addLayoutChildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addChildViews() {
        userInfo = WZUserInfoView()
        contentView.addSubview(userInfo!)
        
        flowLayout = UICollectionViewFlowLayout()
        flowLayout?.minimumLineSpacing = margin
        flowLayout?.minimumInteritemSpacing = margin
        picView = WZPicCollectionView(frame: .zero, collectionViewLayout: flowLayout!)
        picView?.backgroundColor = UIColor.white
        contentView.addSubview(picView!)
        
        transmitView = WZTransmitView()
        contentView.addSubview(transmitView!)
    }
    
    private func addLayoutChildViews() {
        userInfo?.snp.makeConstraints({ (make) in
            make.top.left.right.equalTo(self.contentView)
        })
        
        picView?.snp.makeConstraints({ (make) in
            make.top.equalTo((userInfo?.snp.bottom)!).offset(10 * HEIGHT_RATIO)
            make.left.equalTo(self.contentView).offset(15 * WIDTH_RATIO)
            make.right.equalTo(self.contentView).offset(-15 * WIDTH_RATIO)
            make.height.equalTo(100 * HEIGHT_RATIO)
        })
        
        transmitView?.snp.makeConstraints({ (make) in
            make.top.equalTo((userInfo?.snp.bottom)!).offset(10 * HEIGHT_RATIO)
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
            make.height.equalTo(100 * HEIGHT_RATIO)
        })
    }
    
    func heightWithModel(model: WZHomeModel) -> CGFloat {
        if ((model.pic?.count) != nil) {
            switch model.pic?.count {
            case 1?:
                tempHeight = 400 * HEIGHT_RATIO
            case 2?:
                tempHeight = 400 * HEIGHT_RATIO
            default:
                let count = (model.pic?.count)! % 3
                let temp = count == 0 ? 0 : 1
                tempHeight = tempWidth / 3 * CGFloat((model.pic?.count)! / 3 + temp)
            }
        }
        let tempH = tempHeight != nil ? tempHeight : 0
        var countHeight: CGFloat = 0
        if model.isTransmit! {
            countHeight = model.text!.boundingRect(with: CGSize(width: SCREEN_WIDTH - 30 * WIDTH_RATIO, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.height + tempH! + 20 * HEIGHT_RATIO + model.transmitText!.boundingRect(with: CGSize(width: SCREEN_WIDTH - 30 * WIDTH_RATIO, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.height + 25 * HEIGHT_RATIO
        } else {
            countHeight = model.text!.boundingRect(with: CGSize(width: SCREEN_WIDTH - 30 * WIDTH_RATIO, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.height + tempH! + 20 * HEIGHT_RATIO
        }
        
        return countHeight
        
    }

}
