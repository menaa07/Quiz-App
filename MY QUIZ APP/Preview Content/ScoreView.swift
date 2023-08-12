//
//  ScoreView.swift
//  MY QUIZ APP
//
//  Created by Mena Haitham on 12/08/2023.
//

import SwiftUI

struct ScoreView: View {
    var score : Int
    var totalQuestions : Int
    
    var body: some View {
        ZStack{
            Color.blue
            VStack {
                CircularProgressView(progress: CGFloat(score) / CGFloat(totalQuestions))
                    .frame(width: 150, height: 150)
                Text("You Got")
                    .bold()
                    .font(.title)
                Text("\(score)/\(totalQuestions)")
                    .font(.title2)
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 3, totalQuestions: 5)
    }
}
