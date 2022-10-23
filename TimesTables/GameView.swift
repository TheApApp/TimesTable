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
        .onAppear(perform: printIt)
    }

    func generateQuestions(number: Int) -> [(Problem)] {
        var problems = [Problem]()

        for _ in 0..<number {
            problems.append(Problem(id: UUID(), a: Int.random(in: 2...times), b: Int.random(in: 2...times)))
        }
        return problems
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
