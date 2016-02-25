//
//  HappinessViewController.swift
//  Happiness
//
//  Created by ying on 15/10/28.
//  Copyright © 2015年 ying. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            //添加手指捏合的手势识别
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            //
            //faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "changeHappiness:"))
        }
    }
    
    var happiness: Int = 100 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    
    private struct Constans {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    //处理手指的滑动手势
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constans.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
            
        }
    }

    
    
    private func updateUI()
    {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }

}
