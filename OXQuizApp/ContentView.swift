//
//  ContentView.swift
//  OXQuizApp
//
//  Created by 조영민 on 1/10/25.
//

import SwiftUI
struct ContentView: View {
    // 변수 선언
    @State var number1: Int = 4
    @State var number2: Int = 2
    @State var resultNumber: Int = 9
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack {
                Text("다음 수식은 맞을까요?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 50)
                
                Spacer()
                
                Text("\(number1) x \(number2) = \(resultNumber)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                
                Spacer()
                
                VStack {
                    VStack(spacing: 10) {
                        Text("\(countCorrect)개 맞춤")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        
                        Text("\(countWrong)개 틀림")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                }
                .frame(maxWidth: .infinity) // 너비를 중앙으로 확장
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button("✅맞음")  {
                        selectCorrect()
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 120)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    
                    Button("❌틀림") {
                        selectWrong()
                    }
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 120)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                }
                
                Button("다시 시작하기") {
                    reloadGame()
                }
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding(.bottom, 50)
            }
        }
    }
    
    // 문제 카운팅 초기화 함수
    func reloadGame() {
        countCorrect = 0
        countWrong = 0
    }
    
    // 정답 선택 함수
    func selectCorrect() {
        if number1 * number2 == resultNumber {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        generateNewProblem()
    }
    
    // 오답 선택 함수
    func selectWrong() {
        if number1 * number2 != resultNumber {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        generateNewProblem()
    }
    
    // 새로운 문제 생성 함수
    func generateNewProblem() {
        number1 = Int.random(in: 1...10)
        number2 = Int.random(in: 1...20)
        if Bool.random() {
            resultNumber = number1 * number2
        } else {
            resultNumber = Int.random(in: 1...200)
        }
    }
}

#Preview {
    ContentView()
}
