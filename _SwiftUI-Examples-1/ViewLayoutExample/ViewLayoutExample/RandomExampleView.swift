//
//  RandomExampleView.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/04/30.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct RandomExampleView: View {
    var body: some View {
//        body 함수인 경우 return 무조건 하나를 해야하지만, 이렇게 우리는 상황에 따라, 여러개의 뷰를 상태 값에 따라 return 하고 싶다. 그럴경우 Group을 사용하거나, AniView를 사용할 수있는 두가지 방법이 있다. 하지만 AniView같은 경우 형태자체가 무엇인지 정확히 내리지 않기 때문에 성능에 문제가 생길수 있으므로, Group을 추천한다.
        Group {
            if Bool.random() {
                Image("all-out-donuts-thumb")
            } else {
                Text("Better luck next time")
            }
        }
//        if Bool.random() {
//           return AnyView(Image("all-out-donuts-thumb"))
//        } else {
//           return AnyView(Text("Better luck next time"))
//        }
    }
}

struct RandomExampleView_Previews: PreviewProvider {
    static var previews: some View {
        RandomExampleView()
    }
}
