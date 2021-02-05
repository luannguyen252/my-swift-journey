//
//  ContentView.swift
//  SwiftUIPullToRefresh
//
//  Created by 白井駿平 on 2020/01/11.
//  Copyright © 2020 shirai. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ContentView: View {

  @State var isShowing: Bool = false

  let array = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
               "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
               "新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
               "静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
               "奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県",
               "徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県",
               "熊本県","大分県","宮崎県","鹿児島県","沖縄県"
  ]

  var body: some View {
    NavigationView {
      List(array, id: \.self) { text in
        Text(text)
      }
      .navigationBarTitle("都道府県")
    }
    .background(PullToRefresh(action: {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.isShowing = false
      }
    }, isShowing: $isShowing))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
