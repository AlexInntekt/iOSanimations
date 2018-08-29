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
        
        //textFieldOne.layer.position.x -= view.bounds.width
        //textFieldTwo.layer.position.x -= view.bounds.width
        
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

        flyRight.beginTime = CACurrentMediaTime() + 0.3 + Double(x)

        flyRight.delegate = self as! CAAnimationDelegate
        
        return flyRight
    }
    
}

extension ViewController: CAAnimationDelegate
{
    func animationDidStop(_ anim: CAAnimation,
                          finished flag: Bool)
    {
        print("animation did finish")
    }
}

