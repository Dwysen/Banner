//
//  CardCell.swift
//  Banner
//
//  Created by 王彦森 on 2017/12/12.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    var imgView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backView = UIView(frame:contentView.bounds)
        addSubview(backView)

        backView.layer.shadowOpacity = 0.08
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 10, height: 10)
        backView.layer.shadowRadius = 3
        
        imgView = UIImageView(frame:contentView.bounds)
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
        backView.addSubview(imgView)
        
        contentView.addSubview(backView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
