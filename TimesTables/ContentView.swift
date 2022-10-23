//
//  ContentView.swift
//  TimesTables
//
//  Created by Michael Rowe on 10/16/22.
//

import SwiftUI

struct Problem {
//    var id = UUID()
    var a = 0
    var b = 0

    var answer: Int {
        a * b
    }

    var question: String {
        "\(a) x \(b) = "
    }
}

struct ContentView: View {
    @State private var times: Int = 12
    @State private var numberOfQuestions = [5, 10, 20]
    @State private var chosenDifficulty = 0

    @State private var questionText = [String]()
    @State private var answer = 0

    @State private var problems = [Problem]()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Stepper("\(times) Times Table", value: $times, in: 2...12)
                        .font(.title2)
                    Stepper("Number of questions = \(numberOfQuestions[chosenDifficulty])", value: $chosenDifficulty, in: 0...2)
                        .font(.title2)
                    Spacer()
                    Button("Start Game") {
                        path.append("GameView")
                    }
                    .padding()
                    .font(.title)
                    .background(.black)
                    .clipShape(Capsule())
                    Spacer()
                }
                .padding()
                .navigationTitle("Times Tables")
                .navigationDestination(for: String.self) { view in
                    if view == "GameView" {
                        GameView(chosenDifficulty: chosenDifficulty, times: times)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
