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
            //function call here
            print("button press")
        } ) {
                Image(systemName: "lessthan.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.primary)
        }

    }//end CalculatorButton View
    
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
