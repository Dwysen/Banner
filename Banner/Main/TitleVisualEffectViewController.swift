//
//  TitleVisualEffectViewController.swift
//  Banner
//
//  Created by 王彦森 on 2017/11/29.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class TitleVisualEffectViewController: BaseViewController {

    var titleView          : UIView!
    fileprivate var effectView         : UIVisualEffectView!
    fileprivate var vibrancyEffectView : UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleView                           = UIView(frame: CGRect(x: 0, y: 0, width: Screen.Width, height: 66))
    
        view.addSubview(titleView)
        
        effectView                          = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.isUserInteractionEnabled = true
        effectView.frame                    = (titleView?.bounds)!
        titleView?.addSubview(effectView)
        
        vibrancyEffectView       = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: effectView.effect as! UIBlurEffect))
        vibrancyEffectView.frame = effectView.bounds
        effectView.contentView.addSubview(vibrancyEffectView)
        
        let headlineLabel           = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Screen.Width, height: 64))
        headlineLabel.font          = UIFont.HeitiSC(20)
        headlineLabel.textAlignment = .center
        headlineLabel.textColor     = UIColor(red: 0.329, green: 0.329, blue: 0.329, alpha: 1)
        headlineLabel.text          = "Banner"
        headlineLabel.bottom        = effectView.height
        
        let backButton    = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        backButton.center = CGPoint(x: 20, y: headlineLabel.centerY)
        backButton.setImage(UIImage(named: "backIconTypeTwo"),     for: .normal)
        backButton.setImage(UIImage(named: "backIconTypeTwo_pre"), for: .highlighted)
        backButton.addTarget(self, action: #selector(popSelf), for: .touchUpInside)
        
        effectView.contentView.addSubview(headlineLabel)
        effectView.contentView.addSubview(backButton)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func popSelf(){
        
        self.navigationController?.popViewController(animated: true)
        
    }
    


}
