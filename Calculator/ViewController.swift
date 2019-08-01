//
//  ViewController.swift
//  Calculator
//
//  Created by Eduard on 04/07/2019.
//  Copyright © 2019 Eduard Sitdykov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen:Double = 0
    var firstNum:Double = 0
    var operation:Int = 0
    var mathSign:Bool = false
    
    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }else{
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 17 && sender.tag != 12 && sender.tag != 18{
            
            firstNum = Double(result.text!)!
            
            switch sender.tag {
            case 11:
                if numberFromScreen > 0 {
                    result.text = String(firstNum*(-1))
                }else if numberFromScreen < 0{
                    result.text = String(firstNum*(-1))
                }
                mathSign = true
            case 13:
                result.text = "/"
                mathSign = true
            case 14:
                result.text = "x"
                mathSign = true
            case 15:
                result.text = "-"
                mathSign = true
            case 16:
                result.text = "+"
                mathSign = true
            
            default:
                print("error")
            }
            
            print(firstNum)
            operation = sender.tag
            
        }
        if sender.tag == 17 {
            if operation == 13 {
                result.text = String(firstNum / numberFromScreen)
            }
            if operation == 14 {
                result.text = String(firstNum * numberFromScreen)
            }
            if operation == 15 {
                print(firstNum)
                result.text = String(firstNum - numberFromScreen)
            }
            if operation == 16 {
                result.text = String(firstNum + numberFromScreen)
            }
            if operation == 12 {
                result.text = String(firstNum/100*numberFromScreen)
            }
            result.text = revers(text: Double(result.text!)!)
        
        }else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }else if sender.tag == 12 {
            if firstNum == 0 {
                numberFromScreen = numberFromScreen / 100
                result.text = String(numberFromScreen)
            }else{
                numberFromScreen = firstNum / 100 * numberFromScreen
                result.text = String(numberFromScreen)
            }
            result.text = revers(text: Double(result.text!)!)
        }else if sender.tag == 18 {
            if result.text!.contains(".") {
                result.text = result.text
            }else{
                result.text = result.text! + "."
            }
        }
    }
    
    func revers(text: Double) -> String {
        if Double(result.text!)!.truncatingRemainder(dividingBy: 1) == 0 {
            print(Double(result.text!)!.truncatingRemainder(dividingBy: 1))
            return String(Int(text))
        }else{
            return String(text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

