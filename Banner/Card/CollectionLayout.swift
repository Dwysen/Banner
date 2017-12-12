//
//  CollectionLayout.swift
//  DwCollectionView
//
//  Created by 王彦森 on 2017/12/6.
//  Copyright © 2017年 Dwyson. All rights reserved.
//

import UIKit


class CollectionLayout:UICollectionViewFlowLayout {
    
    private let scaleFactor:CGFloat = 0.001
    
    override func prepare() {
        
        super.prepare()
        scrollDirection = .horizontal
        minimumLineSpacing = 20.0
    
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let array:[UICollectionViewLayoutAttributes] =  NSArray.init(array: super.layoutAttributesForElements(in: rect)!, copyItems: true) as! [UICollectionViewLayoutAttributes]
        let centerX = (collectionView?.contentOffset.x)! + (collectionView?.bounds.size.width)! / 2
        
        for attr in array {
            
            let cell_centerX = attr.center.x
            let distance = abs(cell_centerX - centerX)
            let scale:CGFloat = 1 / ( 1 + distance * scaleFactor)
            attr.transform3D = CATransform3DMakeScale(1.0, scale, 1.0)
        }
        
        return array

        
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let visibleX = proposedContentOffset.x
        let visibleY = proposedContentOffset.y
        let visibleW = collectionView?.bounds.size.width
        let visibleH = collectionView?.bounds.size.height
        //获取可视区域
        let targetRect = CGRect(x: visibleX, y: visibleY, width: visibleW!, height: visibleH!)
        
        //中心点的值
        let centerX = proposedContentOffset.x + (collectionView?.bounds.size.width)!/2
        
        //获取可视区域内的attributes对象
        let attrArr = super.layoutAttributesForElements(in: targetRect)!
        //如果第0个属性距离最小
        var min_attr = attrArr[0]
        for attributes in attrArr {
            if (abs(attributes.center.x-centerX) < abs(min_attr.center.x-centerX)) {
                min_attr = attributes
            }
        }
        //计算出距离中心点 最小的那个cell 和整体中心点的偏移
        let ofsetX = min_attr.center.x - centerX
        return CGPoint(x: proposedContentOffset.x+ofsetX, y: proposedContentOffset.y)
    }
    
}

