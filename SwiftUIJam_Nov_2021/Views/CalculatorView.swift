//
//  CalculatorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Joel Sereno on 11/5/21.
//

import SwiftUI

struct CalculatorView: View {
    
    //MARK: - Properties
    
    let data = (1...12).map {"Button \($0)"} //Grid must count data items
    
    //grid properties
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    //MARK: - View
    var body: some View {
        
        VStack {
            //TODO: DisplayView expected to replace this ZStack
            ZStack {
                RoundedRectangle(cornerRadius: 3.0)
                    .frame(height: UIScreen.main.bounds.height / 5)
                    .padding(.horizontal)
                    .foregroundColor(Color.blue)
                Text("Display Area")
                    .foregroundColor(.primary)
                    .font(.title)
            }
            
            LazyVGrid (columns: columns, spacing: 20)
            {
                ForEach(data, id: \.self) { item in
                    CalculatorButton()
                        //.frame(maxHeight: .infinity)
                        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: UIScreen.main.bounds.height/30, maxHeight: .infinity)
                }
            }
            .padding(.horizontal)
            .frame(
                maxHeight: .infinity)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        
    }// end CalculatorView
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
