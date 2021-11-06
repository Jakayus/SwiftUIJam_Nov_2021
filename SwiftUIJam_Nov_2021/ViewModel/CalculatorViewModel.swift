//
//  CalculatorViewModel.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/6/21.
//

import Foundation



class CalculatorViewModel: ObservableObject {
    
    enum Symbols: String {
        case plus = "+"
        case minus = "-"
        case divide = "/"
        case multiply = "x"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
    }
    
    @Published var expression : String = ""
    @Published var answer : String?
    
    var lastDigitIsNumber: Bool {
        if let last = expression.last {
            return last.isNumber
        }
        return false
    }
    
    
    let expressionCalculator = ExpressionCalculator()
    
    
    func buttonPressed(_ input: Symbols) -> Void {
        
        switch input {
            
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            expression.append(input.rawValue)
            
        case .plus, .minus, .multiply, .divide:
            var expression_copy = expression
            expression_copy.append(input.rawValue)
            if expressionCalculator.validate(expression_copy) {
                expression.append(input.rawValue)
            }

        }

    }
    
    
}
