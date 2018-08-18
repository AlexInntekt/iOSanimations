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
    
    @IBAction func button(_ sender: Any)
    {
        //do stuff
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: [], animations:
        {
            self.button.center.y += 70
            self.button.alpha = 0
        })
    }
    
    func initialUISetup()
    {
        self.textFieldTwoo.isSecureTextEntry = true //password field
        
        self.textFieldOne.center.x -= self.view.bounds.width
        self.textFieldTwoo.center.x -= self.view.bounds.width
        self.button.center.x -= self.view.bounds.width
    }
    
    func chainedAnimations()
    {
        UIView.animate(withDuration: 0.6, delay: 0.4, options: [.curveEaseOut], animations:
          {
            self.textFieldOne.center.x += self.view.bounds.width
          },
            completion:
             { _ in
                UIView.animate(withDuration: 0.6, delay: 0.3, options: [.curveEaseOut], animations:
                  {
                     self.textFieldTwoo.center.x += self.view.bounds.width
                  }, completion:
                     { _ in
                        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0 , options: [.curveEaseOut], animations:
                        {
                                self.button.center.x += self.view.bounds.width
                        }, completion: nil)
                     })
            })
    }



}

