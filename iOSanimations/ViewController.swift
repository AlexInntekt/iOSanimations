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
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    @IBOutlet var titleLabel: UILabel!
    
    var isMenuOpen = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    }


    @IBAction func actionToggleMenu(_ sender: Any)
    {
        isMenuOpen = !isMenuOpen
        menuHeightConstraint.constant = isMenuOpen ? 200.0 : 60.0
        titleLabel.text = isMenuOpen ? "Select Item" : "Packing List"
        
        UIView.animate(withDuration: 1.0, delay: 0.0,
                       usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0,
                       options: .curveEaseIn,
                       animations: {
                        self.view.layoutIfNeeded()
        },
                       completion: nil
        )
    }
    


}

