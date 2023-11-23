//
//  ContentView.swift
//  Bullseye
//
//  Created by Gaultier on 22/11/2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button{
                        viewModel.isPopoverVisible.toggle()
                    }
                    label: {
                        RoundedImageViewStroked(systemName: "list.dash")
                    }
                    .popover(isPresented: $viewModel.isPopoverVisible, content: {
                        LeaderboardView(viewModel: viewModel)
                    })
                    Spacer()
                    Button{
                        viewModel.restartGame()
                    } label: {
                        RoundedImageViewFilled(systemName: "arrow.counterclockwise")
                    }
                    
                }
                .padding(.horizontal, 10.0)
                Spacer()
                TitleView(target: String(viewModel.target))
                SliderView(viewModel: viewModel)
                HitMeButton(viewModel: viewModel)
                    .padding(.top, 20.0)
                Spacer()
                HStack{
                    VStack{
                        Text("Score")
                        RoundedTextView(text: String(viewModel.score))
                    }
                    Spacer()
                    VStack{
                        Text("Round")
                        RoundedTextView(text: String(viewModel.round))
                    }
                }
                .padding([.leading, .bottom, .trailing], 20.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
