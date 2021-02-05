//
//  ContentView.swift
//  CalculatorApp
//
//  Created by RyoNishimura on 2020/08/28.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var resultScreen = "" // Textの内容を保存する変数
    // Buttonで使うTextを配列にまとめる
    let inputItem = [["9","8","7","÷"],
                     ["6","5","4","×"],
                     ["3","2","1","-"],
                     ["0","C","=","+"]]
    
    var body: some View {
        VStack {
            Spacer()
            Text(resultScreen) // ボタン入力のモニター
                .font(.largeTitle)
            Spacer()
            ForEach((0...3), id: \.self) { row in
                HStack{
                    ForEach((0...3), id: \.self){ col in
                        Button(action: {
                            if((Int(self.inputItem[row][col])) != nil){
                                // 数値
                                self.resultScreen += self.inputItem[row][col]
                            }else{
                                if((row != 3) || (col == 3)){
                                    // 四則演算子
                                    let strArray = self.resultScreen.components(separatedBy: " ")
                                    if(strArray.count == 3){
                                        // 計算結果を表示する。
                                        let total = self.calculation(self.resultScreen)
                                        self.resultScreen = total
                                    }
                                    let paddingOperator = " " + self.inputItem[row][col] + " "
                                    self.resultScreen += paddingOperator
                                }else if(col == 1){
                                    // 入力内容を初期化
                                    self.resultScreen = ""
                                }else{
                                    // 計算結果を表示する。
                                    let total = self.calculation(self.resultScreen)
                                    self.resultScreen = total
                                }
                            }
                        }){
                            Spacer()
                            Text(self.inputItem[row][col])
                            Spacer()
                        }
                    }
                }
            .padding(30)
            }
        }
    }
    func calculation(_ concentsInputted: String) -> String{
        var nestInt = 0
        var total = 0
        var checkOperator = 0
        var checkNumber = true
        let strArray = concentsInputted.components(separatedBy: " ")
        for target in strArray {
            if(Int(target) != nil){
                if(checkNumber){
                    nestInt = Int(target)!
                    checkNumber.toggle()
                }else{
                    switch checkOperator {
                    case 1:
                        total += nestInt + Int(target)!
                        break
                    case 2:
                        total += nestInt - Int(target)!
                        break
                    case 3:
                        total += nestInt * Int(target)!
                        break
                    case 4:
                        total += nestInt / Int(target)!
                        break
                    default:
                        break
                    }
                    checkOperator = 0
                    checkNumber.toggle()
                }
            }else{
                if(target == "+"){
                    checkOperator = 1
                }else if(target == "-"){
                    checkOperator = 2
                }else if(target == "×"){
                    checkOperator = 3
                }else if(target == "÷"){
                    checkOperator = 4
                }
            }
        }
        return String(total)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
