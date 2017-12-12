//
//  ParallaxViewController.swift
//  Banner
//
//  Created by 王彦森 on 2017/12/12.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class ScrollImageViewController:TitleVisualEffectViewController,UIScrollViewDelegate{
    
    fileprivate let viewTag            : Int       = 1000
    fileprivate var pictures           : [UIImage] = [UIImage]()
    fileprivate var scrollView         : UIScrollView!
    fileprivate var onceLinearEquation : Math!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onceLinearEquation = Math((x : 0,                  imageViewX : -50),
                                  (x : view!.width, imageViewX : 270 - 80))
        pictures.append(UIImage(named: "qopv")!)
        pictures.append(UIImage(named: "1")!)
        pictures.append(UIImage(named: "qopv")!)
        pictures.append(UIImage(named: "1")!)
        pictures.append(UIImage(named: "qopv")!)
        
        scrollView                                = UIScrollView(frame: (view?.bounds)!)
        scrollView.delegate                       = self
        scrollView.isPagingEnabled                = true
        scrollView.backgroundColor                = UIColor.black
        scrollView.showsVerticalScrollIndicator   = false
        scrollView.bounces                        = false
        scrollView.contentSize                    = CGSize(width:  Screen.Width, height: CGFloat(pictures.count) * Screen.Height)
        view.addSubview(scrollView)
        view.bringSubview(toFront: titleView)
        
        for (i, image) in pictures.enumerated() {
            
            let showView              = ParallaxImageView(frame: CGRect(x:0, y: CGFloat(i) * Screen.Height, width: Screen.Width, height: Screen.Height))
            showView.imageView.image = image
            showView.tag             = viewTag + i
            scrollView.addSubview(showView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let Y = scrollView.contentOffset.y
        
        for i in 0 ..< pictures.count {
            
            let showView = scrollView.viewWithTag(viewTag + i) as! ParallaxImageView
            showView.imageView.y = onceLinearEquation.k * (Y - CGFloat(i) * Screen.Height) + onceLinearEquation.b
        }
    }
}



