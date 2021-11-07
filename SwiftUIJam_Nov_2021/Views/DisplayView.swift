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
    @Binding var focusingAnswer: Bool
    @Binding var cursorIndex: Int
    @State private var displayPressed = false
    @State private var cursorOpacity: CGFloat = 1
    @State private var cursorAnimating = true
    @State private var animationStartTask: Task = Task{}
    var body: some View {
        VStack(alignment: .leading) {
            //An empty expression messed with the height of the cursor
            Text(expression != "" ? expression : " ")
                .font(.system(size: focusingAnswer ? 32 : 62, weight: .medium, design: .monospaced))
                .lineLimit(1)
                .minimumScaleFactor(0.3)
                .truncationMode(.head)
                .overlay(
                    cursor
                )
                .alignment(.leading)
                .animation(.easeInOut, value: focusingAnswer)
                
            HStack(spacing: 0) {
                Text("= ")
                if let answer = answer {
                    Text("\(answer)")
                }
            }
            .lineLimit(1)
            .minimumScaleFactor(1)
            .truncationMode(.tail)
            .font(.system(size: focusingAnswer ? 62 : 32, weight: .medium, design: .monospaced))
            .opacity(focusingAnswer ? 1 : 0.5)
            .alignment(.leading)
            .animation(.easeInOut, value: focusingAnswer)
            
        }
        
        .padding()
        .overlay(
            //The view will not be visible when errorMessage is nil

            DisplayErrorView(errorMessage: focusingAnswer ? errorMessage : nil)
                    .alignment(.topTrailing)

        )


    }
    
    
    //I do kind of feel bad for the people that coded the first cursors. This is complicated even with monospace characters.
    var cursor: some View {
        GeometryReader { proxy in
            HStack(spacing: 0){
            //Cursor
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 4)
                    .opacity(cursorAnimating ? cursorOpacity : 1)
                //Decides the position of the cursor
                    .offset(x: calculateCursorOffset(proxy: proxy))
                    .animation(nil, value: displayPressed)
                //Cursor gets larger when it is moved
                    .padding(.vertical, displayPressed ? -2 : 2)
                    .animation(.easeInOut, value: displayPressed)
                                    
                Spacer()
            }
            .contentShape(Rectangle())
            .gesture(
                //Gesture to move the cursor
                DragGesture(minimumDistance: 0, coordinateSpace: .named("expressionDisplay"))
                    .onChanged({ offset in
                        focusingAnswer = false
                        displayPressed = true
                        calculateCursorIndex(proxy: proxy, offset: offset)
                    })
                    .onEnded({ _ in
                        displayPressed = false
                    })
            )
            .coordinateSpace(name: "expressionDisplay")
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

        }
    }
    
    func calculateCursorOffset(proxy: GeometryProxy) -> CGFloat {
        //If there is time to account for truncating, the code should just be put here, probably
        //Can't divide by 0 you know.
        let expressionLength = max(expression.count, 1)
        return proxy.size.width * CGFloat(cursorIndex)/CGFloat(expressionLength)
    }

    func calculateCursorIndex(proxy: GeometryProxy, offset: DragGesture.Value) {
        //If there is time to account for truncating, the code should just be put here, probably here too
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
    @State var focusingAnswer: Bool = true
    var body: some View {
        VStack {
            DisplayView(expression: "1+3", answer: "4",errorMessage: "Couldn't find operator '&'", focusingAnswer: $focusingAnswer, cursorIndex: $cursorIndex)
            Button("hdhfs", action: {
                focusingAnswer.toggle()
            })
        }
        
    }
}

@available(iOS 15.0, *)
struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}
