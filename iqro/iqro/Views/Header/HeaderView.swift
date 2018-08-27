//
//  HeaderView.swift
//  iqro
//
//  Created by Ibnu Siena Syam on 8/25/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            setUpView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView(){
        if let view = (UINib(nibName: String(describing: HeaderView.self), bundle: nil)).instantiate(withOwner: self, options: nil).first as? HeaderView {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view)
        }
    }
}
