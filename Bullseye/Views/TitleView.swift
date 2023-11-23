//
//  TitleView.swift
//  Bullseye
//
//  Created by Gaultier on 22/11/2023.
//

import SwiftUI

struct TitleView: View {
    
    var target: String
    
    var body: some View {
        Text("Put the BullsEye as close as you can")
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
        Text(target)
            .font(.title)
            .bold()
    }
}

#Preview {
    TitleView(target: "50")
}
