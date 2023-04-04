//
//  MagnificationGestureBootcamp.swift
//  SwiftUIContinued
//
//  Created by Санжар Асанов on 4/4/23.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Swiftful Thinking")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Image(systemName: "text.bubble.fill")
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        
        
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .font(.title)
        //            .padding(40)
        //            .background(Color.red.cornerRadius(10))
        //            .scaleEffect(1 + currentAmount + lastAmount)
        //            .gesture(
        //                MagnificationGesture()
        //                    .onChanged { value in
        //                        currentAmount = value - 1
        //                    }
        //                    .onEnded { value in
        //                        lastAmount += currentAmount
        //                        currentAmount = 0
        //                    }
        //            )
        
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
