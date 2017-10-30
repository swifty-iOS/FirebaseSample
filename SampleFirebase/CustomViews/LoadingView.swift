//
//  LoadingView.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 26/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

class  LoadingView {
    
    static private var actvityView: LoadingActivityView?
    
    private init() {
        
    }
    
    class func show() {
        hide()
        if actvityView == nil {
            actvityView = LoadingActivityView.init(frame: UIScreen.main.bounds)
        }
        AppDelegate.shared.window?.addSubview(actvityView!)
        AppDelegate.shared.window?.bringSubview(toFront: actvityView!)
        
    }
    
    class func hide() {
        actvityView?.removeFromSuperview()
    }
    
    private class LoadingActivityView: UIView {
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            print("This method should not call")
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            let size = CGSize(width: 100, height: 100)
            let origion = CGPoint(x: bounds.size.width/2 - size.width/2, y: bounds.size.height/2 - size.height/2)
            let imageView = UIImageView(frame: CGRect(origin: origion, size: size))
            imageView.image = UIImage.gifImageWithName("Ripple")
            addSubview(imageView)
        }
        
    }
    
}
