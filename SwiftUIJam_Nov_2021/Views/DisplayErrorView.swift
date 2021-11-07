//
//  DisplayErrorView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Tallak Lindseth von der Lippe on 07/11/2021.
//

import SwiftUI

struct DisplayErrorView: View {
    var errorMessage: String?
    @State private var showingWholeMessage = true
    var body: some View {
        if let errorMessage = errorMessage {
            HStack{
                Image(systemName: "exclamationmark.circle.fill")
                    .background(Circle().foregroundColor(.primary))
                    .foregroundColor(.red)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showingWholeMessage.toggle()
                        }
                    }
                if showingWholeMessage {
                    Text(errorMessage)
                }
            }
            .padding(8)
            .background(
                Color.red.brightness(0.4)
                    .cornerRadius(16, corners: [.bottomLeft, .topLeft])
                    .transition(.move(edge: .trailing))
            )
            .transition(.move(edge: .trailing))
        } else {
            EmptyView()
        }
    }
}

struct DisplayErrorView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayErrorView(errorMessage: "Error error")
    }
}
