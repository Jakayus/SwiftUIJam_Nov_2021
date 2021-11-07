//
//  DisplayErrorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Tallak Lindseth von der Lippe on 07/11/2021.
//

import SwiftUI

struct DisplayErrorView: View {
    var errorMessage: String?
    
    var body: some View {
        if let errorMessage = errorMessage {
            HStack{
                Image(systemName: "exclamationmark.circle.fill")
                    .background(Circle().foregroundColor(.primary))
                    .foregroundColor(.red)
                Text(errorMessage)
            }
            .padding(8)
            .background(
                Color.red.brightness(0.4)
                    .cornerRadius(16, corners: .bottomLeft)
            )
            .transition(.move(edge: .top))
        } else {
            EmptyView()
        }
    }
}

struct DisplayErrorView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayErrorView(errorMessage: "Unknown operator '$' ")
    }
}
