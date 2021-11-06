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
            TempDisplayView() //TODO: create real DisplayView
            
            LazyVGrid (columns: columns, spacing: 20)
            {
                ForEach(data, id: \.self) { item in
                    CalculatorButton()
                }
            }
            .padding(.horizontal)
            .frame(
                maxHeight: .infinity)
        }
        
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
