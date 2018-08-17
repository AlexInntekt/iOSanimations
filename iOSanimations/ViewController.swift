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
        
        initialUISetup()
        chainedAnimations()
        
    }
    
    func initialUISetup()
    {
        self.textFieldOne.center.x -= self.view.bounds.width
        self.textFieldTwoo.center.x -= self.view.bounds.width
        self.button.center.x -= self.view.bounds.width
    }
    
    func chainedAnimations()
    {
        UIView.animate(withDuration: 0.9, delay: 0.4, options: [.curveEaseOut], animations:
          {
            self.textFieldOne.center.x += self.view.bounds.width
          },
            completion:
             { _ in
                UIView.animate(withDuration: 0.9, delay: 0.3, options: [.curveEaseOut], animations:
                  {
                     self.textFieldTwoo.center.x += self.view.bounds.width
                  }, completion:
                     { _ in
                        UIView.animate(withDuration: 0.9, delay: 0.1, options: [.curveEaseOut], animations:
                        {
                                self.button.center.x += self.view.bounds.width
                        }, completion: nil)
                     })
            })
    }



}

