//
//  DisplayView.swift
//  SwiftUIJam_Nov_2021
//
//  Created by Tallak Lindseth von der Lippe on 06/11/2021.
//

import SwiftUI
//We should probably set deployment target to iOS 15
@available(iOS 15.0, *)
struct DisplayView: View {
    var expression: String
    var answer: String?
    var errorMessage: String?
    @Binding var cursorIndex: Int
    @State private var displayPressed = false
    @State private var cursorOpacity: CGFloat = 1
    @State private var cursorAnimating = true
    @State private var animationStartTask: Task = Task{}
    var body: some View {
        HStack {
            Text(expression)
                .font(.system(size: 42, weight: .medium, design: .monospaced))
                .overlay(
                    GeometryReader { proxy in
                        HStack(spacing: 0){
                        //Cursor
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: 4)
                                .opacity(cursorAnimating ? cursorOpacity : 1)
                            //Decides the position of the cursor
                                .offset(x: proxy.size.width * CGFloat(cursorIndex)/CGFloat(expression.count))
                                .animation(nil, value: displayPressed)
                            //Cursor gets larger when it is moved
                                .padding(.vertical, displayPressed ? -2 : 2)
                                .animation(.easeInOut, value: displayPressed)
                            //Start the cursor animation syklus.
                                .onAppear() {
                                    withAnimation(.easeInOut(duration: 0.5).delay(0.5).repeatForever()) {
                                        self.cursorOpacity = 0
                                    }
                                }
                            //When cursor moves, the animation timer is reset.
                                .onChange(of: cursorIndex) {_ in
                                    resetCursorAnimationTimer()
                                    //Taptic feedback when the cursor changes position while dragging
                                    if displayPressed {
                                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                    }
                                }
                                
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .gesture(
                            //Gesture to move the cursor
                            DragGesture(minimumDistance: 0, coordinateSpace: .named("expressionDisplay"))
                                .onChanged({ offset in
                                    displayPressed = true
                                    calculateCursorIndex(proxy: proxy, offset: offset)
                                })
                                .onEnded({ _ in
                                    displayPressed = false
                                })
                        )
                    }
                    .coordinateSpace(name: "expressionDisplay")
                )
            Spacer()
            if let answer = answer {
                Text("\(answer)")
            }
        }
        .font(.system(size: 42, weight: .medium, design: .monospaced))
        .padding()
        .overlay(
            //The view will not be visible when errorMessage is nil
            DisplayErrorView(errorMessage: errorMessage)
                .alignment(.topTrailing)
        )


    }
    
    func calculateCursorIndex(proxy: GeometryProxy, offset: DragGesture.Value) {
        let displayWidth = proxy.frame(in: .named("expressionDisplay")).width
        let ratio = offset.location.x / displayWidth
        let newCursorIndex = Int(ceil((ratio * CGFloat(expression.count)) - 0.5))
        
        self.cursorIndex = min(max(newCursorIndex, 0), expression.count)
    }
    
    //To create a delay before the cursor the has moved
    func resetCursorAnimationTimer() {
        //Cancel the last timer
        animationStartTask.cancel()
        cursorAnimating = false
        animationStartTask = Task {
            do {
                try await Task.sleep(nanoseconds: 1000000000)
                try Task.checkCancellation()
                cursorAnimating = true
            } catch { }
        }
    }
}

@available(iOS 15.0, *)
fileprivate struct Wrapper: View {
    @State var cursorIndex = 3
    var body: some View {
        DisplayView(expression: "1+1*3-sqrt(2)", answer: "4",errorMessage: "Couldn't find operator '&'", cursorIndex: $cursorIndex)
    }
}

@available(iOS 15.0, *)
struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}
