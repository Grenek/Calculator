//
//  ViewController.swift
//  Calculator
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
        
        // Проверка что выводить в label.text при различных условиях
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
            
        case 11: // Del button
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
            calculatedNumber = 0
            
        case 12: // Divide button
            guard label.text != "" && label.text != "." else {break}
            dividePressed = true
            multiplyPressed = false
            minusPressed = false
            plusPressed = false
            mathInProgress = true
            pointPressed = false
            
            // Проверка что число на экране == округленный calculatedNumber для точности расчетов
            if label.text == String(round(1000000*calculatedNumber)/1000000) {
                previousNumber = calculatedNumber
            } else {
                previousNumber = Double(self.label.text!)!
            }
            
        case 13: // Multiply button
            guard label.text != "" && label.text != "." else {break}
            dividePressed = false
            multiplyPressed = true
            minusPressed = false
            plusPressed = false
            mathInProgress = true
            pointPressed = false
            
            // Проверка что число на экране == округленный calculatedNumber для точности расчетов
            if label.text == String(round(1000000*calculatedNumber)/1000000) {
                previousNumber = calculatedNumber
            } else {
                previousNumber = Double(self.label.text!)!
            }
            
        case 14: // Substract button
            guard label.text != "" && label.text != "." else {break}
            dividePressed = false
            multiplyPressed = false
            minusPressed = true
            plusPressed = false
            mathInProgress = true
            pointPressed = false
            previousNumber = Double(self.label.text!)!
            
        case 15: // Add button
            guard label.text != "" && label.text != "." else {break}
            dividePressed = false
            multiplyPressed = false
            minusPressed = false
            plusPressed = true
            mathInProgress = true
            pointPressed = false
            previousNumber = Double(self.label.text!)!
            
        case 16: // Equals button
            guard label.text != "" && label.text != "." else {break}
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
            
            // Выводим значение без .0 если число целое
            if isInteger == true {
                label.text = String(format: "%.0f", calculatedNumber)
            } else {
                label.text = String(round(1000000*calculatedNumber)/1000000)
            }
            
        case 17: // логика нажатия на ","
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
        label.isUserInteractionEnabled = false
    }
    
}

