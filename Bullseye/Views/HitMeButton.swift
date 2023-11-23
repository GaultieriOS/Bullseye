//
//  HitMeButton.swift
//  Bullseye
//
//  Created by Gaultier on 23/11/2023.
//

import SwiftUI

struct HitMeButton: View {
    
   @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Button("Hit me"){
            viewModel.alertIsVisible = true
            print("Test")
        }
        .bold()
        .padding()
        .background(
            Color.blue
        )
        .foregroundColor(.white)
        .cornerRadius(15)
        .alert("Hello there",
                   isPresented: $viewModel.alertIsVisible,
                   actions: {
                Button("Awesome"){
                    viewModel.getScore()
                }
            },
                   message: {
            Text("Your number is \(Int(viewModel.sliderValue))\n You scored \(viewModel.points(sliderValue: Int(viewModel.sliderValue)))")
            }
            )
    }
}

#Preview {
    HitMeButton(viewModel: GameViewModel())
}
