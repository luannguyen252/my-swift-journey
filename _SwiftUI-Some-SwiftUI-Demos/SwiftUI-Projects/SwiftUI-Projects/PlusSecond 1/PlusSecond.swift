//
//  PlusSecond.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/9.
//


import SwiftUI

struct PlusSecond: View {
    
    @State var timeCount: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                SecondView(timeCount: $timeCount)
                Spacer()
                ActionView(timeCount: $timeCount)
            }
        }
    }
}

struct PlusSecond_Previews: PreviewProvider {
    static var previews: some View {
        PlusSecond()
    }
}


fileprivate struct SecondView: View {
    
    @Binding var timeCount: Double
    
    var time: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.timeCount += 0.1
        }
    }
    
    
    var body: some View {
        HStack {
            Text(timeString(time: timeCount))
                .font(.system(size: 100, weight: .black))
                .italic()
                .foregroundColor(.white)
                .onAppear(perform: {
                    _ = self.time
                })
            
            Text("s")
                .font(.system(size: 50, weight: .black))
                .italic()
                .foregroundColor(.white)
                .padding(.top)
        }
        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 4)
        .padding(.top, 100)
    }
    
    func timeString(time: Double) -> String {
        String(format: "%.1f", time)
    }
    
    
}


fileprivate struct ActionView: View {
    
    @Binding var timeCount: Double
    @State var tapCount: Int = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.tapCount += 1
                self.timeCount += 1
            }, label: {
                Text("+1s")
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(.white)
            })
            .frame(width: 200, height: 80)
            .background(Color.yellow)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 15, x: 0, y: 4)
            
            Text("Tap Count: \(tapCount)")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
                .italic()
                .padding(.top, 15)
        }
        .padding(.bottom, 20)
    }
}
