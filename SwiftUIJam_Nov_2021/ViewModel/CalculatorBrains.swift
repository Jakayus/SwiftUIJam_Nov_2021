//
//  CalculatorBrains.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/6/21.
//

import Foundation

class CalculatorBrains: ObservableObject {
    
    @Published var expression : String = ""
    @Published var answer : String?
    @Published var errorMessage: String?
    @Published var cursorIndex: Int = 0
    
    var lastDigitIsNumber: Bool {
        if let last = expression.last {
            return last.isNumber
        }
        return false
    }
    
    //allows button type to be determined
    var buttonEnumState: Symbols = .one
    
    //accessing Model
    let expressionCalculator = ExpressionCalculator()
    
    
    func buttonPressed(_ input: Symbols) -> Void {
        
        //action depending on button type
        switch input {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            writeToExpression(str: input.rawValue)
        case .decimal:
            print("TODO: ")
        case .plus, .minus:
            //No babysitting, the user will be able to enter an invalid expression and get an error. We could try to babysit, but I think it would take too much time to get right.
            writeToExpression(str: input.rawValue)
        case .multiply:
            writeToExpression(str: "*")
        case .divide:
            writeToExpression(str: "/")
        // FIXME: All clear and backspace are not working as expected, Please look into it.
        case .allClear:
            expression = ""
        case .backspace:
            expression = String(expression.removeLast())
        }
        
        
        updateAnswer()
    }
    
    private func writeToExpression(str: String) {
        var expressionArray = expression.map{$0}
        let strArray = str.map{$0}
        //To make sure it doesn't insert out of bounds
        cursorIndex = min(expression.count, cursorIndex)
        expressionArray.insert(contentsOf: strArray, at: cursorIndex)
        expression = String(expressionArray)
        //Probably redundant
        cursorIndex = min(expression.count, cursorIndex + 1)
    }
    
    private func updateAnswer() {
        do {
            answer = try expressionCalculator.evaluate(expression)
            errorMessage = nil
        } catch  {
            if let error = error as? ExpressionError {
                answer = nil
                errorMessage = error.description
            }
        }
    }
}
