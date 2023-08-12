//
//  ContentView.swift
//  Kadai6
//
//  Created by Hajime on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 50.0
    @State private var questionNumber = Int.random(in: 1...100)
    @State private var isShowResult = false
    @State var alertMessage: String?
    var body: some View {
        VStack {
            Text("\(questionNumber)")
                .font(.largeTitle)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 50, trailing: 0))
            Slider(value: $value, in: 1...100)
            HStack {
                Text("1")
                Spacer()
                Text("100")
            }
            Button {
                let firstLine: String
                if questionNumber == Int(value) {
                    firstLine = "あたり！"
                } else {
                    firstLine = "はずれ！"
                }
                alertMessage = "\(firstLine)\nあなたの値：\(Int(value))"
                isShowResult = true
            } label: {
                Text("判定！")
            }
            .padding(.top, 50)
            Spacer()
        }
        .padding()
        .alert(
            "結果",
            isPresented: $isShowResult,
            presenting: alertMessage,
            actions: { _ in
                Button("再挑戦", action: {
                    questionNumber = Int.random(in: 1...100)
                })
            },
            message: {
                Text($0)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
