//
//  ForEachExample.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/04/30.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ForEachExample: View {
    let colors:[Color] = [.red, .green, .blue]
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]

    var body: some View {
// \.self 같은 경우는 내부 컨텐츠들을 고유하게 식별할 수 있는 기능들을 한다고 함.
// \ .self를 사용하면 Swift에 각 항목이 고유 한 값을 사용하여 고유하게 식별됩니다. 따라서 배열 [1, 2, 3]이 있고 \\ .self로 각 값을 식별하면 첫 번째 항목에 식별자 1, 두 번째 2 및 세 번째 3이 있음을 의미합니다.
        VStack {
            VStack (alignment:.leading){
                ForEach((1...10).reversed(), id:\.self) {
                    Text("\($0)...")
                }
                Text("Ready or not, here I come!")
            }
            VStack {
                ForEach(colors, id:\.self) { color in
                    Text(color.description.capitalized).padding().background(color)
                }
            }
            
//            고유 식별자를 커스텀하게 쓰고 싶은 경우는 해당 데이터에 식별자를 추가해야함, UUID()는 식별하기 좋은 식별자
            VStack {
                ForEach(results, id: \.id) { result in
                    Text("Result: \(result.score)")
                }
            }
            
//            만약 데이터 클래스가 Identifiable 프로토콜을 준수한다면, id 파라매터에 \.id 파라매터를 사용할 필요가 없다.
            VStack {
                ForEach(results) { result in
                    Text("Result: \(result.score)")
                }
            }
            
        }
    }
}

struct ForEachExample_Previews: PreviewProvider {
    static var previews: some View {
        ForEachExample()
    }
}
