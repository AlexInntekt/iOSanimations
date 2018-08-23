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


    @IBOutlet var butonMenu: UIButton!
    @IBAction func actionToggleMenu(_ sender: Any)
    {   //check if menu is expanded or shrinked
        isMenuOpen = !isMenuOpen
        
        
        
        //order changes in the layout, the changes will be animated in the first part of the animation
        titleLabel.superview?.constraints.forEach   //change x coordinate of the title
        { constraint in
            if constraint.firstItem === titleLabel &&
                constraint.firstAttribute == .centerX
             {
                
                constraint.constant = isMenuOpen ? -100.0 : 0.0
                return
             }
            //change y of title
            if constraint.identifier == "TitleCenterY"
             {
                constraint.isActive = false
                print("924hg294hg")
                let newConstraint = NSLayoutConstraint(
                    item: titleLabel,
                    attribute: .centerY,
                    relatedBy: .equal,
                    toItem: titleLabel.superview!,
                    attribute: .centerY,
                    multiplier: isMenuOpen ? 0.67 : 1.0,
                    constant: 5.0)
                newConstraint.identifier = "TitleCenterY"
                newConstraint.isActive = true
             }
                
        }
        
        //order changes in the layout, the changes will be animated in the first part of the animation
        menuHeightConstraint.constant = isMenuOpen ? 200.0 : 60.0  //height of menu
        titleLabel.text = isMenuOpen ? "Select Item" : "Packing List"
        
        
        UIView.animate(withDuration: 1.0, delay: 0.0,
                       usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0,
                       options: .curveEaseIn,
                       animations: {
                        self.view.layoutIfNeeded()  //animate the change of height of the menu
                        
                        //animate the rotation of the button
                        let angle: CGFloat = self.isMenuOpen ? .pi / 4 : 0.0
                        self.butonMenu.transform = CGAffineTransform(rotationAngle: angle)
                        
        },
                       completion: nil
        )
        
        
    }
    


}

