//
//  CalculatorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/5/21.
//

import SwiftUI

struct CalculatorView: View {
    
    let data = (1...12).map {"Button \($0)"}
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 0.3)
                    .frame(height: UIScreen.main.bounds.height / 5)
                Text("Display Area")
                    .foregroundColor(.white)
            }
            LazyVGrid (columns: columns, spacing: 20)
            {
                ForEach(data, id: \.self) { item in
                    CalculatorButton()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}


struct testView: View {
    var body: some View {
        Text("test")
    }
}
