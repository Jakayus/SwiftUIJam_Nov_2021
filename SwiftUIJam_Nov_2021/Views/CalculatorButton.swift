//
//  CalculatorButton.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Takasur Azeem on 06/11/2021.
//

import SwiftUI

struct CalculatorButton: View {
    
    @State var buttonText: String
    @State var buttonTextColor: Color
    @State var buttonColor: Color
    
    var body: some View {
        Button(action: {
            //function call here
            print("button press")
        } ) {
            
            //Geometry reader used to allow Text to change based on landscape or portrait
            GeometryReader { geo in
                ZStack {
                    RoundedRectangle(cornerRadius: 2.0)
                        .foregroundColor(buttonColor)
                    Text("\(buttonText)")
                        .font(.system(size: geo.size.height > geo.size.width ? geo.size.width * 0.4 : geo.size.height * 0.4 ))
                        .foregroundColor(buttonTextColor)
                }
            }
                
        }

    }//end CalculatorButton View
    
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(buttonText: "test", buttonTextColor: Color.white, buttonColor: Color.orange)
    }
}
