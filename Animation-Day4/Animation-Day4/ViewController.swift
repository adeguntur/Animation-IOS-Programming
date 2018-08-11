//
//  ViewController.swift
//  Animation-Day4
//
//  Created by octavianus on 09/08/18.
//  Copyright © 2018 octavianus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //how to add gesture to uiview
        //Create the gesture object
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        firstBox.addGestureRecognizer(tapGesture)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        
        let swipeTop = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeTop.direction = .up
        
        let swipeBottom = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeBottom.direction = .down
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        
        firstBox.addGestureRecognizer(swipeRight)
        firstBox.addGestureRecognizer(swipeTop)
        firstBox.addGestureRecognizer(swipeBottom)
        firstBox.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func handleSwipe(){
        changeColor()
        changePosition()
    }
    
    func changeColor(){
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        
        UIView.animate(withDuration: 1) {
            self.firstBox.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
        }

    }
    
    func changePosition(){
        
        let screenWidth = UInt32(view.frame.width)
        let screenHeight = UInt32(view.frame.height)
        
        let safeX = screenWidth - 150
        let safeY = screenHeight - 150
        
        let randomX = Int(arc4random_uniform(safeX))
        let randomY = Int(arc4random_uniform(safeY))
        
        UIView.animate(withDuration: 1) {
            self.firstBox.frame = CGRect(x: randomX, y: randomY, width: 150, height: 150)
        }
    }
    
//    @objc func handleTap(){
//        print("this box is tapped")
//        UIView.animate(withDuration: 1) {
//            //Second state
//            self.firstBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
//        }
//
//    }




}

