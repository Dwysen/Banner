//
//  TitleViewController.swift
//  Banner
//
//  Created by 王彦森 on 2017/11/29.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UIGestureRecognizerDelegate {

    
    var enableInteractivePopGestureRecognizer:Bool? {
        
        get {
            return self.navigationController?.interactivePopGestureRecognizer?.isEnabled
        }
        
        set(newVal){
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = newVal!
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.isNavigationBarHidden = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
