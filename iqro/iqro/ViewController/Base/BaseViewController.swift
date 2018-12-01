//
//  BaseViewController.swift
//  iqro
//
//  Created by Ibnu Siena Syam on 12/1/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var spinner: UIActivityIndicatorView!
    var mask: UIView!
    var containerBounds: CGRect?
    
    func showSpinnerWithMask(_ show: Bool!){
        showMask(show)
        showSpinner(show)
    }
    
    func showMask(_ show: Bool!){
        if show! && mask == nil {
            let windowView: UIView = getWindow().subviews[0]
            let windowFrame: CGRect = windowView.frame
            
            for view in getWindow().subviews {
                if view.tag == 1 {
                    mask = view
                }
            }
            
            if mask == nil {
                mask = UIView(frame: containerBounds != nil ? containerBounds! : self.view.bounds)
                mask.tag = 1
                mask.frame = CGRectMake(0, 0, windowFrame.width, windowFrame.height)
                mask?.backgroundColor = UIColor(white: 0, alpha: 0.6)
                
                getWindow().addSubview(mask)
            }
        }
        enableBackButton(!show)
        mask?.isHidden = !show
        if mask != nil {
            getWindow().bringSubview(toFront: mask)
        }
        
        if !show && mask != nil {
            mask = nil
        }
    }
    
    func showSpinner(_ show: Bool!){
        if show! && spinner == nil {
            initSpinner()
        }
        (show!) ? spinner.startAnimating() : spinner.stopAnimating()
    }
    
    func initSpinner() {
        spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        spinner.transform = CGAffineTransform(scaleX: 2, y: 2)
        spinner.sizeToFit()
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        if containerBounds != nil {
            spinner.frame = containerBounds!
        }
        
        super.view.addSubview(spinner)
        super.view.bringSubview(toFront: spinner)
    }
    
    func getWindow() -> UIWindow {
        return UIApplication.shared.keyWindow ?? UIApplication.shared.windows[0]
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func enableBackButton(_ enable: Bool!) {
        self.navigationController?.navigationBar.isUserInteractionEnabled = enable
    }
}
