//
//  ViewController.swift
//  VKPhotos
//
//  Created by Вадим on 15.03.2019.
//  Copyright © 2019 Shamratov Vadim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousNumber:Double = 0
    var currentNumber:Double = 0
    var calculatedNumber:Double = 0
    var mathInProgress = false
    var dividePressed = false
    var multiplyPressed = false
    var minusPressed = false
    var plusPressed = false
    var calculationCompleted = false
    var pointPressed = false
    
    @IBOutlet weak var label: UITextField!
    
    @IBAction func numbers(_ sender: UIButton) {
        if pointPressed == true {
            label.text = label.text! + String(sender.tag-1)
        } else if calculationCompleted == true {
            label.text = ""
            label.text = label.text! + String(sender.tag-1)
            calculationCompleted = false
            mathInProgress = false
        } else if mathInProgress == false {
            label.text = label.text! + String(sender.tag-1)
        } else {
            label.text = ""
            label.text = label.text! + String(sender.tag-1)
            mathInProgress = false
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        switch sender.tag {
        case 11:
            label.text = ""
            mathInProgress = false
            dividePressed = false
            multiplyPressed = false
            minusPressed = false
            plusPressed = false
            calculationCompleted = false
            pointPressed = false
            previousNumber = 0
            currentNumber = 0
        case 12:
            dividePressed = true
            mathInProgress = true
            pointPressed = false
            previousNumber = Double(self.label.text!)!
        case 13:
            multiplyPressed = true
            mathInProgress = true
            pointPressed = false
            previousNumber = Double(self.label.text!)!
        case 14:
            minusPressed = true
            mathInProgress = true
            pointPressed = false
            previousNumber = Double(self.label.text!)!
        case 15:
            plusPressed = true
            mathInProgress = true
            pointPressed = false
            previousNumber = Double(self.label.text!)!
        case 16:
            currentNumber = Double(self.label.text!)!
            calculationCompleted = true
            pointPressed = false
            mathInProgress = false
            if dividePressed == true {
                calculatedNumber = previousNumber / currentNumber
                dividePressed = false
            }
            if multiplyPressed == true {
                calculatedNumber = previousNumber * currentNumber
                multiplyPressed = false
            }
            if minusPressed == true {
                calculatedNumber = previousNumber - currentNumber
                minusPressed = false
            }
            if plusPressed == true {
                calculatedNumber = previousNumber + currentNumber
                plusPressed = false
            }
            let isInteger = floor(calculatedNumber) == calculatedNumber
            if isInteger == true {
                label.text = String(format: "%.0f", calculatedNumber)
            } else {
                label.text = String(round(10000000*calculatedNumber)/10000000)
            }
        case 17:
            pointPressed = true
            if label.text?.contains(".") == false && mathInProgress == false {
                label.text = label.text! + "."
            } else if label.text == "" || mathInProgress == true || calculationCompleted == true {
                label.text = "0."
                mathInProgress = false
            }
            
        default: break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

