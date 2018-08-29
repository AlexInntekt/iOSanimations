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
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var myView: UIView!
    
    @IBOutlet var bt: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
  
      
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //self.textFieldOne.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        textFieldOne.layer.position.x -= view.bounds.width
        
        UIView.animate(withDuration: 0.6)
        {
            self.textFieldOne.layer.position.x += self.view.bounds.width
        }

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

    
    
    @IBAction func anim(_ sender: Any)
    {
//        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
//            self.textFieldOne.transform = CGAffineTransform(translationX: 0, y: 0)
//        }, completion:
//            { _ in
//                UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [.curveEaseInOut], animations: {
//                    self.textFieldOne.transform = CGAffineTransform(translationX: 0, y: 400)
//                }, completion: nil)
//
//        })
//

//        let flyRight = CABasicAnimation(keyPath: "position.x")
//        flyRight.fromValue = -view.bounds.size.width/2
//        flyRight.toValue = 2*view.bounds.size.width/2
//        flyRight.duration = 0.5
//
//        flyRight.fillMode = kCAFillModeBoth
//
//        flyRight.beginTime = CACurrentMediaTime() + 0.3
//
//        textFieldOne.layer.add(flyRight, forKey: nil)
        
    }
    
  

}

