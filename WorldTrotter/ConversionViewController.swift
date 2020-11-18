//
//  ViewController.swift
//  WorldTrotter
//
//  Created by User on 17.11.2020.
//

import UIKit

class ConversionViewController: UIViewController {
    //let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
//        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor,
//                                UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor]
//
//        gradientLayer.frame.size = view.frame.size
//        view.layer.insertSublayer(gradientLayer, at: 0)
        
        

    }

    override func viewWillLayoutSubviews() {
        //gradientLayer.frame.size = view.frame.size
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //let randomColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
        //let layer = CALayer()
        //layer.backgroundColor = randomColor
        //layer.frame.size = view.frame.size
        //view.layer.insertSublayer(layer, at: 0)
        //view.backgroundColor = randomColor
    }

}

