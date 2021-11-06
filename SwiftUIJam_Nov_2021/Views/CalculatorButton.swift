//
//  CalculatorButton.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Takasur Azeem on 06/11/2021.
//

import SwiftUI

struct CalculatorButton: View {
    
    var body: some View {
        Button(action: {
            
        } ) {
            Image(systemName: "lessthan.circle.fill")
                .foregroundColor(.white)
                .padding()
        }
        .background(RoundedRectangle(cornerRadius: 3.0))
        .foregroundColor(.orange)
        
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
