//
//  ContentView.swift
//  Animations
//
//  Created by Soumyattam Dey on 01/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat=1
    @State private var animation3D=0.0
    
    @State private var enabled=false
    var body: some View {
        VStack{
            
            
            
            Button("Tap Me"){
//                self.animationAmount+=1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2-animationAmount))
                    .animation(
                        Animation.easeOut(duration: 2)
                            .repeatForever(autoreverses: false)
                    )
            )
            .onAppear{
                self.animationAmount=2
            }
            
            Button("Tap"){
                withAnimation{
                    self.animation3D+=360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .rotation3DEffect(
                .degrees(animation3D),
                axis: (x:0,y:1,z:0)
            )
            
            Button("Tap Me"){
                self.enabled.toggle()
            }
            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(enabled ? Color.blue : Color.red)
            .animation(nil)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 :0))
            .animation(.interpolatingSpring(stiffness: 20, damping: 1))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
