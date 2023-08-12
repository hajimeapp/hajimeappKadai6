//
//  ContentView.swift
//  Kadai6
//
//  Created by Hajime on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    struct AlertInfo {
        let questionNumber: Int
        let sliderValue: Int

        var message: String {
            let firstLine: String
            if questionNumber == sliderValue {
                firstLine = "あたり！"
            } else {
                firstLine = "はずれ！"
            }
            return "\(firstLine)\nあなたの値：\(sliderValue)"
        }
    }

    @State private var value = 50.0
    @State private var questionNumber = Int.random(in: 1...100)
    @State private var isShowResult = false
    @State var alertInfo: AlertInfo?
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
                alertInfo = AlertInfo(
                    questionNumber: questionNumber,
                    sliderValue: Int(value)
                )

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
            presenting: alertInfo,
            actions: { _ in
                Button("再挑戦", action: {
                    questionNumber = Int.random(in: 1...100)
                })
            },
            message: { alertInfo in
                Text(alertInfo.message)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
