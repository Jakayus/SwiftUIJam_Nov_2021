//
//  DisplayView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Tallak Lindseth von der Lippe on 06/11/2021.
//

import SwiftUI

struct DisplayView: View {
    var expression: String
    var answer: String?
    var body: some View {
        HStack {
            
            Text(expression)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
            
            
                
            
            Spacer()
            if let answer = answer {
                Text("\(answer)")
            }
        }
        .font(.system(size: 42, weight: .medium, design: .monospaced))
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(expression: "1+1*3-sqrt(2)", answer: "4")
    }
}
