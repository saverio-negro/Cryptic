//
//  CircleButtonView.swift
//  Cryptic
//
//  Created by Saverio Negro on 7/29/26.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10,
                x: 0,
                y: 0
            )
            .padding()
    }
}

#Preview("Light Mode", traits: .sizeThatFitsLayout) {
    CircleButtonView(iconName: "info")
}

#Preview("Dark Mode", traits: .sizeThatFitsLayout) {
    Group {
        CircleButtonView(iconName: "plus")
    }
    .environment(\EnvironmentValues.colorScheme, .dark)
}
