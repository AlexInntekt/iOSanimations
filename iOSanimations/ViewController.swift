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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.anim(1)
      
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        
    }


    
    @IBAction func anim(_ sender: Any)
    {
        
        let flyRight = CABasicAnimation(keyPath: "position.x")
        flyRight.fromValue = -view.bounds.size.width/2
        flyRight.toValue = view.bounds.size.width/2
        flyRight.duration = 0.5
        
        textFieldOne.layer.add(flyRight, forKey: nil)
    }
    
  

}

