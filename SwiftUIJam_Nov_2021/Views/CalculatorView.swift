//
//  CalculatorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/5/21.
//

import SwiftUI

struct CalculatorView: View {
    
    let data = (1...12).map {"Button \($0)"} //Grid must count data items
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    
    var body: some View {
        
        VStack {
            //DisplayView expected to replace this ZStack
            ZStack {
                RoundedRectangle(cornerRadius: 3.0)
                    .frame(height: UIScreen.main.bounds.height / 5)
                    .padding(.horizontal)
                    .foregroundColor(Color.blue)
                Text("Display Area")
                    .foregroundColor(.primary)
            }.layoutPriority(1)
            
            LazyVGrid (columns: columns, spacing: 20)
            {
                ForEach(data, id: \.self) { item in
                    CalculatorButton()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: UIScreen.main.bounds.height/30, maxHeight: .infinity)
                }
            }
            .padding(.horizontal)
        }
        
        
        
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
