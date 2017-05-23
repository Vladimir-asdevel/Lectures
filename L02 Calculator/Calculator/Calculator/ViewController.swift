//
//  ViewController.swift
//  Calculator
//
//  Created by mvv on 21.05.17.
//  Copyright © 2017 MVV Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    /// Дисплей калькулятора
    @IBOutlet weak var display: UILabel!
    
    /// Пользователь в середине ввода
    var userIsInTheMiddleOfTyping = false
    
    /// Обработка нажатия кнопки с цифрами
    ///
    /// - Parameter sender: нажатая цифра
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    /// Значение на дисплее
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    /// "Мозги" калькулятора
    private var brain = CalculatorBrain()
    
    /// Обработка нажатия кнопки выполнения операций
    ///
    /// - Parameter sender: нажатая операция
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result
        {
            displayValue = result
        }
    }
}

