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
        
        //self.textFieldOne.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        textFieldOne.layer.position.x -= view.bounds.width
        textFieldTwo.layer.position.x -= view.bounds.width
        
        UIView.animate(withDuration: 0.7, delay: 0.1, usingSpringWithDamping: 0, initialSpringVelocity: 0.0, options: [], animations: {
            self.textFieldOne.layer.position.x += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 0.9, delay: 0.3, usingSpringWithDamping: 0, initialSpringVelocity: 0.0, options: [], animations: {
               self.textFieldTwo.layer.position.x += self.view.bounds.width
            })


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

