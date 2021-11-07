//
//  CalculatorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/5/21.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var viewModel = CalculatorViewModel()
    
    //MARK: - View
    var body: some View {
        
        VStack {
            DisplayView(expression: viewModel.expression, answer: viewModel.answer, errorMessage: viewModel.errorMessage, cursorIndex: $viewModel.cursorIndex)
            VStack {
                
                HStack {
                    CalculatorButton(buttonText: "", buttonTextColor: Color.white, buttonColor: Color.black, buttonSymbol: Symbols.seven, viewModel: viewModel)
                    CalculatorButton(buttonText: ".", buttonTextColor: Color.white, buttonColor: Color.black, buttonSymbol: Symbols.eight, viewModel: viewModel)
                    CalculatorButton(buttonText: ".", buttonTextColor: Color.white, buttonColor: Color.black, buttonSymbol: Symbols.nine,viewModel: viewModel)
                    CalculatorButton(buttonText: ".", buttonTextColor: Color.white, buttonColor: Color.orange, buttonSymbol: Symbols.multiply, viewModel: viewModel)
                }
                
                HStack {
                    CalculatorButton(buttonText: "7", buttonTextColor: Color.white, buttonSymbol: Symbols.seven, viewModel: viewModel)
                    CalculatorButton(buttonText: "8", buttonTextColor: Color.white, buttonSymbol: Symbols.eight, viewModel: viewModel)
                    CalculatorButton(buttonText: "9", buttonTextColor: Color.white, buttonSymbol: Symbols.nine,viewModel: viewModel)
                    CalculatorButton(buttonText: "×", buttonTextColor: Color.white, buttonColor: Color.orange, buttonSymbol: Symbols.multiply, viewModel: viewModel)
                }
                
                HStack {
                    CalculatorButton(buttonText: "4", buttonTextColor: Color.white, buttonSymbol: Symbols.four, viewModel: viewModel)
                    CalculatorButton(buttonText: "5", buttonTextColor: Color.white, buttonSymbol: Symbols.five, viewModel: viewModel)
                    CalculatorButton(buttonText: "6", buttonTextColor: Color.white, buttonSymbol: Symbols.six, viewModel: viewModel)
                    CalculatorButton(buttonText: "-", buttonTextColor: Color.white, buttonColor: Color.orange, buttonSymbol: Symbols.minus, viewModel: viewModel)
                }
                HStack {
                    CalculatorButton(buttonText: "1", buttonTextColor: Color.white, buttonSymbol: Symbols.one, viewModel: viewModel)
                    CalculatorButton(buttonText: "2", buttonTextColor: Color.white, buttonSymbol: Symbols.two, viewModel: viewModel)
                    CalculatorButton(buttonText: "3", buttonTextColor: Color.white, buttonSymbol: Symbols.three, viewModel: viewModel)
                    CalculatorButton(buttonText: "+", buttonTextColor: Color.white, buttonColor: Color.orange, buttonSymbol: Symbols.plus, viewModel: viewModel)
                }
                
                HStack {
                    
                    CalculatorButton(buttonText: "0", buttonTextColor: Color.white, buttonSymbol: Symbols.zero, viewModel: viewModel)
                    //Empty button, needs update
                    CalculatorButton(buttonText: "🧦", buttonTextColor: Color.white, buttonSymbol: Symbols.zero, viewModel: viewModel)
                    //TODO: Need more cases
                    CalculatorButton(buttonText: ".", buttonTextColor: Color.white, buttonSymbol: Symbols.zero, viewModel: viewModel)
                    CalculatorButton(buttonText: "=", buttonTextColor: Color.white, buttonColor: Color.orange, buttonSymbol: Symbols.zero, viewModel: viewModel)
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
                .foregroundColor(Color.gray)
            Text("Display Area")
                .foregroundColor(.primary)
                .font(.title)
        }
    }
}
