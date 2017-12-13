//
//  ViewController.swift
//  DwCollectionView
//
//  Created by 王彦森 on 2017/12/6.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class CardViewController : BaseViewController {
    
    private var collectionView:UICollectionView?
    private var layout:CollectionLayout?
    private var page = 0
    private var pageFrame = UIScreen.main.bounds.size.width - 60
    private var sectionCount = 50
    
    var backView:UIView!
    var imgView:UIImageView!
    
    
    private var imgUrl = ["st","sf","four","qop","jt"]
    private var changePageTimer:Timer?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()
        
        setupTimer()
        
    }
    
    private func setupTimer(){
        
        changePageTimer = Timer(timeInterval: 5, target: self, selector: #selector(autoNextPage), userInfo: nil, repeats: true)
        
        RunLoop.main.add(changePageTimer!, forMode: .commonModes)
        
    }
    
    
    private func setupUI(){
        
        layout = CollectionLayout()
        layout?.itemSize = CGSize(width: Screen.Width - 80, height: 200)
        
        let blackBack = UIView(frame: CGRect(x: 0, y: 0, width: Screen.Width , height: 66 + 125))
        blackBack.backgroundColor = UIColor.black
        view.addSubview(blackBack)
        
        let backButton    = UIButton(frame: CGRect(x: 15, y: 15, width: 21, height: 35))
        backButton.setImage(UIImage(named: "left_arrow_"),     for: .normal)
        backButton.addTarget(self, action: #selector(popSelf), for: .touchUpInside)
        blackBack.addSubview(backButton)
        
        
        let rect = CGRect(x: 0, y: 66, width:Screen.Width, height: 250)
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout!)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.bounces = false
        collectionView?.register(CardCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
        collectionView?.backgroundColor = UIColor.clear
    
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        view.addSubview(collectionView!)
        
//        view.bringSubview(toFront: titleView)
    
    }

    @objc private func autoNextPage(){
        
        guard page < sectionCount * imgUrl.count - 1 else {
            
            changePageTimer?.invalidate()
            return
            
        }
        
        page += 1
        
        
        let nextPoint = CGPoint(x: CGFloat (page) * pageFrame, y: 0)
        
        
        collectionView?.setContentOffset(nextPoint, animated: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
         changePageTimer?.invalidate()
    }
    
    deinit {
        print("CardViewController is release")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func popSelf(){

        self.navigationController?.popViewController(animated: true)

    }

}


extension CardViewController:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionCount
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
        cell.imgView.image = UIImage(named: imgUrl[indexPath.item])
        return cell
    }
    
}

extension CardViewController:UICollectionViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        page = Int(scrollView.contentOffset.x / pageFrame)
        
        setupTimer()
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        changePageTimer?.invalidate()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension CardViewController:UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        switch section {
        case 0:
            return UIEdgeInsetsMake(0, 40, 0, 20)
        case section - 1:
            return UIEdgeInsetsMake(0, 0, 0, 40)
        default:
            return UIEdgeInsetsMake(0, 0, 0, 20)
        }
        
    }
    
}



