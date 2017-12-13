//
//  TableVIewController.swift
//  Banner
//
//  Created by 王彦森 on 2017/11/29.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class TableViewController: BaseViewController {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private var tableView : UITableView!
    
    private let titleArr = ["TransformFade","Card","Vertical"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Banner"
        
//        let fpsLabel = FPSLabel(frame: CGRect(x: UIScreen.main.bounds.width - 45.0, y:UIScreen.main.bounds.height - 25.0 , width: 40.0, height: 20.0))
//        UIApplication.shared.keyWindow?.addSubview(fpsLabel)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 64 - 49 ))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        enableInteractivePopGestureRecognizer = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        enableInteractivePopGestureRecognizer = true
    }
    
}

extension TableViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titleArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let vc = TransformFadeViewController()
            vc.title = titleArr[0]
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if indexPath.row == 1 {
            
            let vc = CardViewController()
            vc.title = titleArr[1]
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        if indexPath.row == 2 {
        
            let vc = ScrollImageViewController()
            vc.title = titleArr[2]
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
