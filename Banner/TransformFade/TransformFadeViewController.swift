//
//  TransformFadeViewController.swift
//

import UIKit

private enum EType : Int {
    
    case typeOne, typeTwo
}

class TransformFadeViewController: TitleVisualEffectViewController {
    
    fileprivate let FadeViewRectHeight  : CGFloat = 300
    fileprivate var images              : [UIImage]!
    fileprivate var tranformFadeViewOne : TranformFadeView!
    fileprivate var tranformFadeViewTwo : TranformFadeView!
    fileprivate var type                : EType = .typeOne
    fileprivate var count               : Int   = 0
    fileprivate var gcdTimer            : GCDTimer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        images = [UIImage]()
        images.append(UIImage(named: "qopv")!)
        images.append(UIImage(named: "1")!)
        
        let FadeViewRect = CGRect(x: 0, y: 0, width:Screen.Width, height: Screen.Height)
        
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        tranformFadeViewOne                      = TranformFadeView(frame: FadeViewRect, verticalCount: 1, horizontalCount: 12,fadeDuradtion: 1, animationGapDuration: 0.075)
        tranformFadeViewOne.imageContentMode     = .scaleAspectFill
        tranformFadeViewOne.image                = currentImage()
        tranformFadeViewOne.start(animated: false, transformTo: .show)
        tranformFadeViewOne.addGestureRecognizer(tapOne)
        view.addSubview(tranformFadeViewOne)
        
        
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        tranformFadeViewTwo                      = TranformFadeView(frame: FadeViewRect,verticalCount: 12, horizontalCount: 1,fadeDuradtion: 1, animationGapDuration: 0.075)
        tranformFadeViewTwo.imageContentMode     = .scaleAspectFill
        tranformFadeViewTwo.image                = currentImage()
        tranformFadeViewTwo.start(animated: false, transformTo: .fade)
        tranformFadeViewTwo.addGestureRecognizer(tapTwo)
        view.addSubview(tranformFadeViewTwo)
        view.bringSubview(toFront: titleView)
        
        gcdTimer          = GCDTimer(in: GCDQueue.Main, delay: 1.0, interval: 8.0)
        weak var weakSelf = self
        gcdTimer.setTimerEventHandler { _ in
            
            weakSelf?.tapImage()
    
        }
        
        gcdTimer.start()
    }
    
    @objc fileprivate func tapImage(){
        
        weak var weakSelf = self
        
        if weakSelf?.type == .typeOne {
            
            weakSelf?.type = .typeTwo
            weakSelf?.view.sendSubview(toBack: (weakSelf?.tranformFadeViewTwo)!)
            weakSelf?.tranformFadeViewTwo.image = weakSelf?.currentImage()
            weakSelf?.tranformFadeViewTwo.start(animated: false, transformTo: .show)
            weakSelf?.tranformFadeViewOne.start(animated: true,  transformTo: .fade)
            
        } else {
            
            weakSelf?.type = .typeOne
            weakSelf?.view.sendSubview(toBack: (weakSelf?.tranformFadeViewOne)!)
            weakSelf?.tranformFadeViewOne.image = weakSelf?.currentImage()
            weakSelf?.tranformFadeViewOne.start(animated: false, transformTo: .show)
            weakSelf?.tranformFadeViewTwo.start(animated: true,  transformTo: .fade)
        }
     
    }
    
    deinit {
        print("TransformFadeViewController is release")
    }
    
    fileprivate func currentImage() -> UIImage {
        
        count = (count + 1) % images.count
        return images[count]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        gcdTimer.destroy()
    }
}

