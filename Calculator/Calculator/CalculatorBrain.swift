//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by mvv on 22.05.17.
//  Copyright © 2017 MVV Corporation. All rights reserved.
//

import Foundation

/// "Мозги" калькулятора
struct CalculatorBrain
{
    /// Накопитель текущего значения
    private var accumulator: Double?
    
    /// Операция
    ///
    /// - constant: ассоциированная константа
    /// - unaryOperation: унарная операция
    /// - binaryOperation->Double: бинарная операция
    /// - equals: операция вычисления значения
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    /// Математические операции
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        "±" : Operation.unaryOperation({ -$0 }),
        "×" : Operation.binaryOperation({ $0 * $1 }),
        "÷" : Operation.binaryOperation({ $0 / $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    /// Выполнение математической операции
    ///
    /// - Parameter symbol: символ математической операции
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }

    /// Установить операнд
    ///
    /// - Parameter operand: устанавливаемый операнд
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    /// Результат вычислений
    var result: Double? {
        get {
            return accumulator
        }
    }
}
