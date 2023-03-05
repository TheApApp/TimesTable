//
//  GameView.swift
//  TimesTables
//
//  Created by Michael Rowe on 10/21/22.
//

import SwiftUI

struct GameView: View {
    var chosenDifficulty: Int
    var times: Int

    init(chosenDifficulty: Int = 0, times: Int = 2) {
        self.chosenDifficulty = chosenDifficulty
        self.times = times

        _problems = State(wrappedValue: generateQuestions())
    }

    @State private var problems = [Problem]()
    @State private var score = 0
    @State private var currentQuestion = 0

    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Text("Times Table")
                    .font(.title)
                HStack {
                    Text("Question \(currentQuestion)/\(problems.count)")
                    Spacer()
                    Text("Score: \(score)")
                }
                .padding(10)
                Text("\(problems[0].question)")
                Spacer()
            }
        }
    }

    func generateQuestions() -> [Problem] {
        let numberOfQuestions = [5, 10, 20]
        let number = numberOfQuestions[chosenDifficulty]
        var p: [Problem] = []
        for _ in 0..<number {
            problems.append(Problem(a: Int.random(in: 2...times), b: Int.random(in: 2...times)))
        }

        printIt()
        return p
        /// todo: https://www.hackingwithswift.com/forums/100-days-of-swiftui/day-35-fatal-error-on-new-view/17006/17082
    }

    func printIt() {
        print("Number of questions = \(problems.count)")
            problems.forEach() { problem in
                print(problem.question)
            }
    }
}

struct GameView_Previews: PreviewProvider {

    static var previews: some View {
        GameView(chosenDifficulty: 0, times: 5)
    }
}
