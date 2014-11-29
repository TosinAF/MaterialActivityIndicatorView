//
//  ViewController.swift
//  MaterialActivityIndicatorView
//
//  Created by Tosin Afolabi on 29/11/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var indicator: MaterialActivityIndicatorView!
    var repeat: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        indicator = MaterialActivityIndicatorView(style: .Large)
        indicator.center = view.center
        view.addSubview(indicator)

        var frame = indicator.frame
        frame.origin.y += 100
        frame.origin.x = 0
        frame.size.width = self.view.frame.size.width

        repeat = UIButton(frame: frame)
        repeat.setTitle("Repeat", forState: .Normal)
        repeat.setTitleColor(UIColor.blackColor(), forState: .Normal)
        repeat.setTitleColor(UIColor.lightGrayColor(), forState: .Disabled)
        repeat.titleLabel?.font = UIFont(name: "Avenir-Book", size: 20.0)
        repeat.titleLabel?.textAlignment = .Center
        repeat.addTarget(self, action: "startAnimation", forControlEvents: .TouchUpInside)
        view.addSubview(repeat)

        startAnimation()
    }

    func startAnimation() {
        repeat!.enabled = false
        indicator!.startAnimating()
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "stopAnimation", userInfo: nil, repeats: false)
    }

    func stopAnimation() {
        repeat!.enabled = true
        indicator!.stopAnimating()
    }
}
