//
//  CalculatorButton.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Takasur Azeem on 06/11/2021.
//

import SwiftUI

struct CalculatorButton: View {
    
    let buttonText: String
    let buttonTextColor: Color
    var buttonColor = Color("NumericButtonBackgrounColour")
    
var buttonSymbol: Symbols?
    @ObservedObject var viewModel: CalculatorBrains
    
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            //function call here
            print("button press")
            if buttonText == "🧦" {
                showingAlert = true
            } else {
                viewModel.buttonPressed(buttonSymbol!)
            }
            print(viewModel.expression)
            
        }) {
            
            //Geometry reader used to allow Text to change based on landscape or portrait
            GeometryReader { geo in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(buttonColor)
                    Text("\(buttonText)")
                        .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.4 : geo.size.height * 0.4 ))
                        .foregroundColor(buttonTextColor)
                }
            }
            
        }.alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Important message"),
                message: Text(#"Wear 🧦 in winter, you may find an iPad Calculator App in them ¯\\_(ツ)_/¯"#),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
    //end CalculatorButton View
    
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(buttonText: "test", buttonTextColor: Color.white, buttonColor: .orange, buttonSymbol: Symbols.one, viewModel: CalculatorBrains())
    }
}
