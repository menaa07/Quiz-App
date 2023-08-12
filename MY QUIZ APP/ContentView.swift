//
//  ContentView.swift
//  MY QUIZ APP
//
//  Created by Mena Haitham on 12/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    func didTapOption(optionNumber: OptionChoice) {
        if questions[questionNumber].correctOption == optionNumber {
            numOfCorrectQuestions += 1
            isCorrect = true
    } else {
        isCorrect = false
        
    }
        isAlertDisplay = true
    }
    
    func optionButton(optionNumber: OptionChoice, iconName: String) -> some View {
        Button {
            didTapOption(optionNumber: optionNumber)
        } label: {
            HStack {
                Image(systemName: iconName)
                switch optionNumber {
                case .one:
                    Text(questions[questionNumber].option1)
                case .two:
                    Text(questions[questionNumber].option2)
                case .three:
                    Text(questions[questionNumber].option3)
                case .four:
                    Text(questions[questionNumber].option4)
                }
            }
        }
    }
    
    @State private var questionNumber: Int = 0
    @State private var isCorrect = true
    @State private var isAlertDisplay = true
    @State private var isSheetPresent = false
    @State private var numOfCorrectQuestions: Int = 0
    
    let questions = [
        Question(questionTitle: "What is the keyword to declare a constant in Swift?", option1: "const", option2: "let", option3: "var", option4: "cons", correctOption: .two),
        Question(questionTitle: "What is the keyword used to define an enumeration in Swift??", option1: "enum", option2: "ENUM", option3: "e_num", option4: "enumu", correctOption: .one),
        Question(questionTitle: "How is a single line comment written in Swift?", option1: "#", option2: "/*", option3: "<!--", option4: "//", correctOption: .four),
        Question(questionTitle: "What keyword is used in Swift to handle errors??", option1: "caught", option2: "err", option3: "try", option4: "trying", correctOption: .three),
        Question(questionTitle: "What is the symbol used to declare a variable is optional?", option1: "?", option2: "*", option3: "//", option4: "$", correctOption: .one)
    ]
    
    var body: some View {
        VStack {
            ProgressView(value: Double(questionNumber + 1),
                         total: Double(questions.count))
            Text(questions[questionNumber].questionTitle)
                .padding()
            VStack {
                HStack {
                    optionButton(optionNumber: .one, iconName: "circle.fill")
                    optionButton(optionNumber: .two, iconName: "square.fill")
                }
                .padding()
                HStack {
                    optionButton(optionNumber: .three, iconName: "triangle.fill")
                    optionButton(optionNumber: .four, iconName: "diamond.fill")
                }
                .padding()
            }
        }
        .padding()
        .alert(isCorrect ? "Correct!" : "Wrong!", isPresented: $isAlertDisplay) {
            Button {
                questionNumber += 1
                if questionNumber == questions.count {
                    isSheetPresent = true
                    questionNumber = 0
                }
            } label: {
                Text("Ok")
            }
        } message: {
            Text(isCorrect ? "You are smart" : "Try again")
        }
        .sheet(isPresented: $isSheetPresent, onDismiss: {numOfCorrectQuestions = 0}, content: {
            ScoreView(score: numOfCorrectQuestions, totalQuestions: questions.count)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
