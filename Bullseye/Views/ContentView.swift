//
//  ContentView.swift
//  Bullseye
//
//  Created by Gaultier on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 20.0
    
    var body: some View {
        VStack{
            Text("Put the BullsEye as close as you can")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
            Text("89")
                .font(.title)
                .bold()
            HStack{
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            .padding(.horizontal)
            Button("Hit me"){
                alertIsVisible = true
            }
            .alert("Hello there",
                   isPresented: $alertIsVisible,
                   actions: {
                Button("Awesome"){}
            },
                   message: {
                Text("Your number is \(Int(sliderValue))")
            }
            )
        }
    }
}

#Preview {
    ContentView()
}
