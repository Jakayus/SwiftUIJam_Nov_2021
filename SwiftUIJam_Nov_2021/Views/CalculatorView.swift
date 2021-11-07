//
//  CalculatorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/5/21.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var viewModel = CalculatorBrains()
    
    //MARK: - View
    var body: some View {
        
        VStack {
            DisplayView(expression: viewModel.expression, answer: viewModel.answer, errorMessage: viewModel.errorMessage, focusingAnswer: $viewModel.focusingAnswer, cursorIndex: $viewModel.cursorIndex)
            VStack {
                
                HStack {
                    CalculatorButton(buttonText: "AC", buttonTextColor: .white,  buttonSymbol: Symbols.allClear, viewModel: viewModel)
                    CalculatorButton(buttonText: "⃪", buttonTextColor: .white,  buttonSymbol: Symbols.backspace, viewModel: viewModel)
                    CalculatorButton(buttonText: "", buttonTextColor: .white, buttonColor:.clear, viewModel: viewModel)
                        .disabled(true)
                    CalculatorButton(buttonText: "÷", buttonTextColor: .white, buttonColor: .orange, buttonSymbol: Symbols.divide, viewModel: viewModel)
                }
                
                HStack {
                    CalculatorButton(buttonText: "7", buttonTextColor: .white, buttonSymbol: Symbols.seven, viewModel: viewModel)
                    CalculatorButton(buttonText: "8", buttonTextColor: .white, buttonSymbol: Symbols.eight, viewModel: viewModel)
                    CalculatorButton(buttonText: "9", buttonTextColor: .white, buttonSymbol: Symbols.nine,viewModel: viewModel)
                    CalculatorButton(buttonText: "×", buttonTextColor: .white, buttonColor: .orange, buttonSymbol: Symbols.multiply, viewModel: viewModel)
                }
                
                HStack {
                    CalculatorButton(buttonText: "4", buttonTextColor: .white, buttonSymbol: Symbols.four, viewModel: viewModel)
                    CalculatorButton(buttonText: "5", buttonTextColor: .white, buttonSymbol: Symbols.five, viewModel: viewModel)
                    CalculatorButton(buttonText: "6", buttonTextColor: .white, buttonSymbol: Symbols.six, viewModel: viewModel)
                    CalculatorButton(buttonText: "-", buttonTextColor: .white, buttonColor: .orange, buttonSymbol: Symbols.minus, viewModel: viewModel)
                }
                HStack {
                    CalculatorButton(buttonText: "1", buttonTextColor: .white, buttonSymbol: Symbols.one, viewModel: viewModel)
                    CalculatorButton(buttonText: "2", buttonTextColor: .white, buttonSymbol: Symbols.two, viewModel: viewModel)
                    CalculatorButton(buttonText: "3", buttonTextColor: .white, buttonSymbol: Symbols.three, viewModel: viewModel)
                    CalculatorButton(buttonText: "+", buttonTextColor: .white, buttonColor: .orange, buttonSymbol: Symbols.plus, viewModel: viewModel)
                }
                
                HStack {
                    
                    CalculatorButton(buttonText: "0", buttonTextColor: .white, buttonSymbol: Symbols.zero, viewModel: viewModel)
                    //Empty button, needs update
                    CalculatorButton(buttonText: "🧦", buttonTextColor: .white, buttonSymbol: Symbols.zero, viewModel: viewModel)
                    //TODO: Need more cases
                    CalculatorButton(buttonText: ".", buttonTextColor: .white, buttonSymbol: Symbols.zero, viewModel: viewModel)
                    CalculatorButton(buttonText: "=", buttonTextColor: .white, buttonColor: .orange, buttonSymbol: Symbols.equals, viewModel: viewModel)
                }
                
            }
            .padding()
        }
        
    }// end CalculatorView
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        //Display both Light and Dark modes
        ForEach(ColorScheme.allCases, id: \.self) {
            CalculatorView().preferredColorScheme($0)
        }
    }
}

struct TempDisplayView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 3.0)
                .frame(height: UIScreen.main.bounds.height / 5)
                .padding(.horizontal)
                .foregroundColor(.gray)
            Text("Display Area")
                .foregroundColor(.primary)
                .font(.title)
        }
    }
}
