//
//  GameView.swift
//  TimesTables
//
//  Created by Michael Rowe on 10/21/22.
//

import SwiftUI

struct GameView: View {
    var problems: [Problem]
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

    func printIt() {
        print("Number of questions = \(problems.count)")
            problems.forEach() { problem in
                print(problem.question)
            }
    }
}

struct GameView_Previews: PreviewProvider {

    static var previews: some View {
        GameView(problems: [Problem(id:UUID(), a: 5, b: 6)])
    }
}
