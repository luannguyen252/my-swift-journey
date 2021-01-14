//
//  SplashScreen.swift
//  RSSReader
//
//  Created by Geonseok Lee on 2020/04/03.
//  Copyright © 2020 Geonseok Lee. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
	
	let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
	
    var body: some View {
		GeometryReader { geometry in
			VStack {
				Spacer()
				HStack(alignment: .bottom) {
					Image("rss")
						.resizable()
						.frame(width: geometry.size.width / 6, height: geometry.size.width / 6)
					Image("news")
						.resizable()
						.frame(width: geometry.size.width / 2, height: geometry.size.width / 2)
						.clipShape(Circle())
					Image("earth")
						.resizable()
						.frame(width: geometry.size.width / 6, height: geometry.size.width / 6)
				}
				.padding()
				Group {
					Text("최신 뉴스를 제공합니다.")
					Text("뉴스의 키워드를 알아보세요")
					Text("뉴스를 클릭하면 원본 뉴스를볼 수 있습니다.")
				}
				.modifier(SplashTitleStyle())
				.frame(width: geometry.size.width * 0.85, alignment: .leading)
				Spacer()
				Text("v\(self.appVersion)")
					.font(.system(.callout))
					.fontWeight(.bold)
					.foregroundColor(.gray)
					.padding(.bottom, 10)
			}
			.background(Color.white)
		}
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
