//
//  CalculatorViewModel.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/6/21.
//

import Foundation



class CalculatorViewModel: ObservableObject {
    
    @Published var expression : String = ""
    @Published var answer : String?
    
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
