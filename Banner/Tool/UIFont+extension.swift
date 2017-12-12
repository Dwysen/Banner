//
//  UIFont+extension.swift
//  Banner
//
//  Created by 王彦森 on 2017/11/30.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func AppleSDGothicNeoThin(_ value : CGFloat) -> UIFont! {
        
        return self.init(name : "AppleSDGothicNeo-Thin", size: value)
    }
    
    class func Avenir(_ value : CGFloat) -> UIFont! {
        
        return self.init(name : "Avenir", size: value)
    }
    
    class func AvenirLight(_ value : CGFloat) -> UIFont! {
        
        return self.init(name : "Avenir-Light", size: value)
    }
    
    class func HeitiSC(_ value : CGFloat) -> UIFont! {
        
        return self.init(name : "Heiti SC", size: value)
    }
    
    class func HelveticaNeueThin(_ value : CGFloat) -> UIFont! {
        
        return self.init(name : "HelveticaNeue-Thin", size: value)
    }
}
