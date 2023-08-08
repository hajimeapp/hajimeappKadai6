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
    @State var resultTitle = "あたり"
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
                if questionNumber == Int(value) {
                    resultTitle = "あたり"
                } else {
                    resultTitle = "はずれ"
                }
                isShowResult = true
            } label: {
                Text("判定！")
            }
            .padding(.top, 50)
            Spacer()
        }
        .padding()
        .alert(isPresented: $isShowResult) {
            Alert(title: Text("結果"), message: Text("\(resultTitle)！\nあなたの値：\(Int(value))"), dismissButton: .default(Text("再挑戦"), action: {questionNumber = Int.random(in: 1...100)}))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
