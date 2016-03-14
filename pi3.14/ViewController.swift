//
//  ViewController.swift
//  pi3.14
//
//  Created by Michael Gonzales on 3/14/16.
//  Copyright © 2016 mkgo. All rights reserved.
//

import UIKit

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
}

class ViewController: UIViewController {
    var pie: Double = 3
    let num: Double = 4
    var a: Double = 2
    var b: Double = 3
    var c: Double = 4
    var x: Double = 1
    
    @IBOutlet weak var pieLabel: UILabel!
    @IBOutlet weak var equationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        
        
    }

    @IBAction func pressPie(sender: AnyObject) {
        calcPie()
        let stringFromDouble = "\(pie)"
        pieLabel.text = stringFromDouble
        let astringFromDouble = "pie+\(form(num))/(\(form(a))*\(form(b))*\(form(c)))"
        equationLabel.text = astringFromDouble
        let button = sender as! UIButton
        button.rotate360Degrees()

    }
    
    func calcPie(){
        pie = pie + num/(a*b*c*x)
        a = a + 2
        b = b + 2
        c = c + 2
        x = x * -1
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func form(temp: Double) -> String{
        let tempVar = String(format: "%g", temp)
        return tempVar
    }


}

