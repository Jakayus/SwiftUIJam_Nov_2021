//
//  ExpressionCalculator.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Tallak Lindseth von der Lippe on 05/11/2021.
//

import Foundation
import Expression

typealias ExpressionError = Expression.Error
struct ExpressionCalculator {
    ///Evaluates the expression and returns the answer as a cleaned up string.
    func evaluate(_ str: String) throws -> String {
        //Using the expression package to evaluate the expression
        let expression = Expression(str)
        let result = try expression.evaluate()
        // Clean up the string here if necessary
        return String(result)
    }
    
    ///Checks whether the given string is valid for evaluation.
    func validate(_ str: String) -> Bool {
        // Tries to evaluate the string. If it fails it returns false.
        do {
            let _ = try Expression(str).evaluate()
        } catch {
            return false
        }
        return true
    }
}
