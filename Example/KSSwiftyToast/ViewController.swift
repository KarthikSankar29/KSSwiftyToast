//
//  ViewController.swift
//  KSSwiftyToast
//
//  Created by Karthik Sankar on 09/25/2016.
//  Copyright (c) 2016 Karthik Sankar. All rights reserved.
//

import UIKit
import KSSwiftyToast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a ni
        
        let ks = KSSwiftyToast(title: "Download Complete")
        ks.showIn(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

