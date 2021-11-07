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
    @Binding var cursorIndex: Int
    @State private var displayPressed = false
    @State var cursorOpacity: CGFloat = 1
    var body: some View {
        HStack {
            
            Text(expression)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
                .overlay(
                    GeometryReader { proxy in
                        HStack(spacing: 0){
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: 4)
                                .offset(x: proxy.size.width * CGFloat(cursorIndex)/CGFloat(expression.count))
                                .animation(nil, value: displayPressed)
                                .padding(.vertical, displayPressed ? -2 : 2)
                                .animation(.easeInOut, value: displayPressed)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .gesture(
                            //Gesture to move the cursor
                            DragGesture(minimumDistance: 0, coordinateSpace: .named("expressionDisplay"))
                                .onChanged({ offset in
                                    displayPressed = true
                                    let displayWidth = proxy.frame(in: .named("expressionDisplay")).width
                                    let ratio = offset.location.x / displayWidth
                                    let newCursorIndex = Int(ceil((ratio * CGFloat(expression.count)) - 0.5))
                                    
                                    self.cursorIndex = min(max(newCursorIndex, 0), expression.count)
                                    
                                })
                                .onEnded({ _ in
                                    displayPressed = false
                                })
                        )
                    }
                    .coordinateSpace(name: "expressionDisplay")
                    .onChange(of: cursorIndex) { newValue in
                        //Taptic feedback when the cursor changes position while dragging
                        if displayPressed {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        }
                    }
                )
            Spacer()
            if let answer = answer {
                Text("\(answer)")
            }
        }
        .font(.system(size: 42, weight: .medium, design: .monospaced))

    }
}

fileprivate struct Wrapper: View {
    @State var cursorIndex = 3
    var body: some View {
        DisplayView(expression: "1+1*3-sqrt(2)", answer: "4", cursorIndex: $cursorIndex)
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}
