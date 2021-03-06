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

    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var animationContainerView: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialUISetup()
        
        chainedAnimations()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        
    }
    
    
    @IBAction func button(_ sender: Any)
    {
        //do stuff
        
        
        //deactivate the the control with a placebo visual effect:
        self.textFieldOne.isEnabled = false
        self.textFieldOne.textColor = UIColor.gray
        self.textFieldTwoo.isEnabled = false
        self.textFieldTwoo.textColor = UIColor.gray
        
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations:
        {
            self.button.center.y *= 2
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
        UIView.animate(withDuration: 0.4, delay: 0.4, options: [.curveEaseOut], animations:
          {
            self.textFieldOne.center.x += self.view.bounds.width
          },
            completion:
             { _ in
                UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseOut], animations:
                  {
                     self.textFieldTwoo.center.x += self.view.bounds.width
                  }, completion:
                     { _ in
                        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0 , options: [.curveEaseOut], animations:
                        {
                                self.button.center.x += self.view.bounds.width
                        }, completion: {_ in })
                     })
            })
    }



}

