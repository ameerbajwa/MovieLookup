//
//  BaseActivityIndicator.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 6/20/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation
import UIKit

class BaseActivityIndicator {
    
    var container: UIView
    var activityContainer: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var activityIndicatorCounter: Int = 0
    
    var backgroundColor: UIColor!
    var loadingIconColor: UIColor!
    var activityIndicatorStyle = UIActivityIndicatorView.Style.large
    

    init(view:UIView){
        container = view
        backgroundColor =  UIColorFromHex(0xffffff, alpha: 0.3)
        loadingIconColor = UIColorFromHex(0x444444, alpha: 0.7)
    }

    init(view:UIView,backgroundColor : UIColor, loadingIconColor : UIColor){
        container = view
        self.backgroundColor = backgroundColor
        self.loadingIconColor = loadingIconColor
        activityIndicatorStyle = UIActivityIndicatorView.Style.medium
    }

    // This creates view and puts activity indicator inside it
    func showActivityIndicator() {
        if(activityIndicatorCounter == 0){
            activityContainer.frame = container.frame
            activityContainer.center = container.center
            activityContainer.backgroundColor = backgroundColor

            loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            loadingView.center = container.center
            loadingView.backgroundColor = loadingIconColor
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10

            activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
            activityIndicator.style = activityIndicatorStyle
            activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);

            loadingView.addSubview(activityIndicator)
            activityContainer.addSubview(loadingView)
            container.addSubview(activityContainer)
            activityIndicator.startAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }

        activityIndicatorCounter+=1
        print("activityIndicatorCounter - \(activityIndicatorCounter)")

    }
    
    /*
    Hide activity indicator
    Actually remove activity indicator from its super view

    @param uiView - remove activity indicator from this view
    */

    func hideActivityIndicator() {
        if(activityIndicatorCounter > 0) {
            activityIndicatorCounter-=1
        }

        if(activityIndicatorCounter == 0){
            activityIndicator.stopAnimating()
            activityContainer.removeFromSuperview()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }

        print("activityIndicatorCounter - \(activityIndicatorCounter)")

    }

    func UIColorFromHex(_ rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}
