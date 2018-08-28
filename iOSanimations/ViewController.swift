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
    var index = 0
    
    
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
                        
                        if self.isMenuOpen
                        {
                            self.showItem()
                        }
                        
        },
                       completion: nil
        )
        
    }
    
    
    
    func showItem()
    {
        if index>7
        {
            index=0
        }; index += 1
        
        let imageView = UIImageView(image: UIImage(named: "\(index).png"))
            imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0,
            alpha: 0.5)
            imageView.layer.cornerRadius = 5.0
            imageView.layer.masksToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
        
        let conX = imageView.centerXAnchor.constraint(equalTo:
            view.centerXAnchor)
        let conBottom = imageView.bottomAnchor.constraint(equalTo:
            view.bottomAnchor, constant: -imageView.frame.height/5)
        let conWidth = imageView.widthAnchor.constraint(equalTo:
            view.widthAnchor, multiplier: 0.33, constant: 0)
        let conHeight = imageView.heightAnchor.constraint(equalTo:
            imageView.widthAnchor)
        NSLayoutConstraint.activate([conX, conBottom, conWidth, conHeight])
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.8, delay: 0.0,
                       usingSpringWithDamping:  0.4, initialSpringVelocity: 0.0,
                       animations: {
                        conBottom.constant = -imageView.frame.size.height/2
                        conWidth.constant = 0.0
                        self.view.layoutIfNeeded()
        },
                       completion: nil
        )
    }
    


}

