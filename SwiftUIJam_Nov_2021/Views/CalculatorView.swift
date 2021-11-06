//
//  CalculatorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/5/21.
//

import SwiftUI

struct CalculatorView: View {
          
    //MARK: - View
    var body: some View {
        
        VStack {
            TempDisplayView() //TODO: create real DisplayView
            
            VStack {
                HStack {
                    CalculatorButton(buttonText: "7", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "8", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "9", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "X", buttonTextColor: Color.white, buttonColor: Color.orange)
                }
                
                HStack {
                    CalculatorButton(buttonText: "4", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "5", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "6", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "-", buttonTextColor: Color.white, buttonColor: Color.orange)
                }
                HStack {
                    CalculatorButton(buttonText: "1", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "2", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "3", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "+", buttonTextColor: Color.white, buttonColor: Color.orange)
                }
                
                HStack {
                    
                    CalculatorButton(buttonText: "0", buttonTextColor: Color.white, buttonColor: Color.black)
                    //Empty button, needs update
                    CalculatorButton(buttonText: "", buttonTextColor: Color.white, buttonColor: Color.black)
                    
                    CalculatorButton(buttonText: ".", buttonTextColor: Color.white, buttonColor: Color.black)
                    CalculatorButton(buttonText: "=", buttonTextColor: Color.white, buttonColor: Color.orange)
                }
                
            }
            .padding()
        }
        
    }// end CalculatorView
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
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
