//
//  SliderView.swift
//  Bullseye
//
//  Created by Gaultier on 23/11/2023.
//

import SwiftUI

struct SliderView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        HStack{
            Text("1")
                .bold()
                .frame(width: 35)
            Slider(value: $viewModel.sliderValue, in: 1.0...100.0)
            Text("100")
                .bold()
                .frame(width: 35)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SliderView(viewModel: GameViewModel())
}
