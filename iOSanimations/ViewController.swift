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
        
        
        animationContainerView = UIView(frame: view.bounds)
        animationContainerView.frame = view.bounds
        view.addSubview(animationContainerView!)
        
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
        
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: [], animations:
        {
            
        })
        
        //trigger activity indicator:
        activityIndicator.center.y = self.button.center.y
        activityIndicator.center.x = self.button.center.x/1.5
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
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
                        }, completion: {_ in self.transitionOfChildView()})
                     })
            })
    }

    func transitionOfChildView()
    {
        let newView = UIImageView(image: UIImage(named: "night")!)
        newView.center = animationContainerView.center
        //add the new view via transition
        UIView.transition(with: animationContainerView,
                          duration: 1,
                          options: [.curveEaseOut, .transitionCrossDissolve],
                          animations: {
                            self.animationContainerView.addSubview(newView)
        },
                          completion: nil
        )
    }

}

