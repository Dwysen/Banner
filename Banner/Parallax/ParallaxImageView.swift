//
//  ParallaxImageView.swift
//  Banner
//
//  Created by 王彦森 on 2017/12/12.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import Foundation


//
//  MoreInfoView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class ParallaxImageView: UIView {
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame : frame)
        
        layer.borderWidth   = 0.5
        layer.borderColor   = UIColor.black.cgColor
        layer.masksToBounds = true
        
        /*
         *     --------------     *
         *-50->|-view-width-|<-50-*
         *     --------------     *
         */
        let rect              = frame
        imageView             = UIImageView(frame: CGRect(x: -50, y: -50, width: rect.size.width + 50 * 2, height: rect.size.height + 50 * 2))
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
