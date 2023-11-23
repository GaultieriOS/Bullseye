//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Gaultier on 23/11/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Leaderboard".uppercased())
                    .font(.title)
                    .bold()
                Spacer()
                Button{
                    viewModel.isPopoverVisible.toggle()
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
            .padding(.horizontal, 10.0)
        }
        HStack(alignment: .top){
            Text("Round")
            Spacer()
            VStack(alignment: .center){
                Text("Score")
            }
            Spacer()
            VStack{
                Text("Date")
            }
        }
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
        .padding([.top, .leading, .trailing], 10.0)
        ScrollView{
            VStack{
                ForEach(viewModel.leaderboardEntries
                    .indices, id: \.self){index in
                        let entry = viewModel.leaderboardEntries[index]
                        RowView(index: index + 1, score: entry.score, date: entry.date)
                            .overlay(
                                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                                    .stroke(lineWidth: Constants.General.strokeWidth)
                                    .foregroundColor(Color("ButtonStrokeColor"))
                                    .padding(.horizontal, 5)
                            )
                    }
            }
        }
    }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
        Text(String(index))
            .frame(width: Constants.General.roundedViewLength, height: 45)
      Spacer()
        Text(String(score))
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
        Text(date, style: .time)
            .multilineTextAlignment(.trailing)
            .padding(.trailing, 10.0)
    }
  }
}

#Preview {
    LeaderboardView(viewModel: GameViewModel())
}
#Preview {
    RowView(index: 10, score: 20, date: Date())
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .stroke(lineWidth: Constants.General.strokeWidth)
                .foregroundColor(Color("ButtonStrokeColor"))
        )
}
