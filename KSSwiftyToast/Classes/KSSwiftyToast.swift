//
//  KSSwiftyToast.swift
//  KSSwiftyToast
//
//  Created by Karthik S on 24/09/16.
//  Copyright © 2016 KarthikSankar. All rights reserved.
//

import UIKit

open class KSSwiftyToast {
    // Variables
    fileprivate var title: String = ""
    fileprivate var cornerRadius: Float = 2.0
    fileprivate var backgroundColor: UIColor = UIColor.black
    fileprivate var alpha: Float = 0.5
    fileprivate var fadeInTime: Float = 0.6
    fileprivate var fadeOutTime: Float = 0.6
    fileprivate var animateFromBottom: Bool = true
    
    // UI Components
    fileprivate var toastView: KSSwiftyToastView!
    
    // MARK: Initializations
    // Singleton Class
    static let sharedInstance = KSSwiftyToast()
    public init() {}
    
    // Init with Title
    public init(title: String) {
        self.title = title                              // Set Title
    }
    
    // Show Toast Message in View Controller
    public func showIn(_ viewController:UIViewController) {
        // Setup Sub Views
        setupUI()
        // Add Toast View to Super View
        viewController.view.addSubview(toastView)
        // Add Constraints
        toastView.setConstraints("V:[view]-10-|", horizontal: "H:|-30-[view]-30-|")
        toastView.alpha = 0.0
        
        // Animate View
        UIView.animate(withDuration: 2.0, animations: {
            self.toastView.alpha = 1.0
        }) { (animateCompleted) in
            // Hide Toast View
            self.hide()
        }
    }
    
    // Hide / Remove View
    func hide() {
        UIView.animate(withDuration: 2.0, animations: {
            self.toastView.alpha = 0.0
        }) { (animationComplete) in
            self.toastView.removeFromSuperview()
        }
    }
    
    // Form Subviews
    fileprivate func setupUI() {
        // Assign Toast View
        toastView = KSSwiftyToastView(background: self.backgroundColor, title: self.title)
        toastView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// KS Toast View
private class KSSwiftyToastView: UIView {
    fileprivate var toastLabel: UILabel!            // Title Label
    fileprivate var toastContentView: UIView!       // Content View
    
    // Init
    init(background:UIColor,title:String) {
        super.init(frame:CGRect.zero)
        
        // Toast Label Config
        toastLabel = UILabel()
        toastLabel.text = title
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.numberOfLines = 0
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.backgroundColor = UIColor.clear
        
        // Toast Content View
        toastContentView = UIView()
        toastContentView.backgroundColor = UIColor.black
        toastContentView.alpha = 0.6
        toastContentView.layer.cornerRadius = 15.0
        toastContentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(toastContentView)                   // Add Toast Content View to Super View
        addSubview(toastLabel)                         // Add ToastLabel to Super View
        
        // Add Constraints to Toast Label
        self.toastContentView.setConstraints("V:|-[view]-|", horizontal: "H:|[view]|")
        
        // Add Constraints to Toast View
        self.toastLabel.setConstraints("V:|-25-[view]-25-|", horizontal: "H:|-20-[view]-20-|")
    }
    
    // Decode
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: UIView Extensions
extension UIView {
    // Set Constraints
    func setConstraints(_ vertical:String!,horizontal:String!) {
        let views: [String:UIView] = ["view" : self]
        
        // Vertical Constraint
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertical, options:.alignAllBottom , metrics: nil, views: views)
        
        // Horizontal Constraint
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontal, options:.alignAllCenterX , metrics: nil, views: views)
        
        NSLayoutConstraint.activate(verticalConstraints)         // Add Vertical Constraints
        NSLayoutConstraint.activate(horizontalConstraints)       // Add Horizontal Constraints
    }
}
