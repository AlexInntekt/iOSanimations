//
//  ViewController.swift
//  iOSanimations
//
//  Created by Manolescu Mihai Alexandru on 18/08/2018.
//  Copyright © 2018 AVP. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet var textFieldOne: UITextField!
    @IBOutlet var textFieldTwo: UITextField!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet var bt: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.layer.cornerRadius = button.frame.width/6
  
      
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        
        
        
        textFieldOne.layer.add(flyRight(delay: 0), forKey: nil)
        textFieldTwo.layer.add(flyRight(delay: 0.5), forKey: nil)

    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
  
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextField = (textField === textFieldOne) ? textFieldOne : textFieldOne
        nextField?.becomeFirstResponder()
        return true
    }

    func animateLoginButton()
    {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 0.5
        groupAnimation.fillMode = kCAFillModeBackwards
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.fromValue = 3.5
        scaleDown.toValue = 1.0
        
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = .pi / 4.0
        rotate.toValue = 0.0
        
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 0.0
        fade.toValue = 1.0
        
        groupAnimation.animations = [scaleDown, rotate, fade]
        button.layer.add(groupAnimation, forKey: nil)
    }
    
    
    @IBAction func buttonFunc(_ sender: Any)
    {
        button.frame.size.width *= 2
        button.frame.size.height *= 0.7
        button.layer.cornerRadius = 10
        button.center.x = view.center.x
        button.setTitle("       Loading...", for: .normal)
    }
    
    
    
    func flyRight(delay x: Double) -> CABasicAnimation
    {
        let flyRight = CABasicAnimation(keyPath: "position.x")
        flyRight.fromValue = -view.bounds.size.width/2
        flyRight.toValue = view.bounds.size.width/2
        flyRight.duration = 0.5

        flyRight.fillMode = kCAFillModeBoth

        flyRight.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        flyRight.beginTime = CACurrentMediaTime() + 0.3 + Double(x)

        return flyRight
    }
    
}



