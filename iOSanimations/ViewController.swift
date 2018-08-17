//
//  ViewController.swift
//  iOSanimations
//
//  Created by Manolescu Mihai Alexandru on 18/08/2018.
//  Copyright © 2018 AVP. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{
    @IBOutlet var textFieldOne: UITextField!
    @IBOutlet var textFieldTwoo: UITextField!
    @IBOutlet var button: UIButtonX!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textFieldOne.center.x -= self.view.bounds.width
        self.textFieldTwoo.center.x -= self.view.bounds.width
        self.button.center.x -= self.view.bounds.width
        
        //textFieldOne.center.x  -= view.bounds.width
        UIView.animate(withDuration: 0.7) {
            self.textFieldOne.center.x += self.view.bounds.width
            self.textFieldTwoo.center.x += self.view.bounds.width
            self.button.center.x += self.view.bounds.width
        }
    }



}

