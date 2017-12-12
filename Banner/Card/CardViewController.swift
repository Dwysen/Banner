//
//  ViewController.swift
//  DwCollectionView
//
//  Created by 王彦森 on 2017/12/6.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit

class CardViewController : TitleVisualEffectViewController {
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    private var collectionView:UICollectionView?
    private var layout:CollectionLayout?
    private var page = 0
    private var pageFrame = UIScreen.main.bounds.size.width - 60
    private var sectionCount = 50
    
    
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
        layout?.itemSize = CGSize(width: screenWidth - 80, height: 200)
        
        let rect = CGRect(x: 0, y: 66, width:screenWidth, height: 250)
        collectionView = UICollectionView(frame: rect, collectionViewLayout: layout!)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
        collectionView?.backgroundColor = UIColor.white
    
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        view.addSubview(collectionView!)
        view.bringSubview(toFront: titleView)
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        changePageTimer?.invalidate()
    }
    
    deinit {
        print("CardViewController is release")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imgView = UIImageView(frame: cell.contentView.bounds)
        imgView.image = UIImage(named: imgUrl[indexPath.row])
        imgView.layer.cornerRadius = 10
        imgView.layer.masksToBounds = true
        cell.addSubview(imgView)
        
        cell.contentView.layer.shadowOpacity = 0.8
        cell.contentView.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.layer.shadowOffset = CGSize(width: 10, height: 10)
        cell.contentView.layer.shadowRadius = 3
        
        return cell
    }
    
    
}

extension CardViewController:UICollectionViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.x / pageFrame)
        
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



