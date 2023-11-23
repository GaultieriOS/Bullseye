//
//  RoundedTextView.swift
//  Bullseye
//
//  Created by Gaultier on 23/11/2023.
//

import SwiftUI

struct RoundedTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .frame(width: 68, height: 56)
            .overlay(RoundedRectangle(cornerRadius: 21)
                .stroke(lineWidth: 2)
                )
    }
}

struct RoundedImageViewFilled: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: 56, height: 56)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundedImageViewStroked: View {
  var systemName: String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: 56, height: 56)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
      )
  }
}


#Preview {
//    RoundedTextView(text: "999")
//    RoundedImageViewFilled(systemName: "arrow.counterclockwise")
    RoundedImageViewStroked(systemName: "list.dash")
}
