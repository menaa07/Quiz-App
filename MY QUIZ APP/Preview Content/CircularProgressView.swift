//
//  CircularProgressView.swift
//  MY QUIZ APP
//
//  Created by Mena Haitham on 12/08/2023.
//

import SwiftUI

struct CircularProgressView: View {
    
    var progress : CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.red)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 270))
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
