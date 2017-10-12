//
//  ViewController.swift
//  CircularProgressBar
//
//  Created by Andres on 9/19/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circularProgressBar: CircularProgressBar!

    @IBAction func sliderAction(_ sender: UISlider) {
        self.circularProgressBar.progress = CGFloat(sender.value)
    }
}

