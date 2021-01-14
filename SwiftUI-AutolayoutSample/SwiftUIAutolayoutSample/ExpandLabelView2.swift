//
//  ExpandLabelView2.swift
//  SwiftUIAutolayoutSample
//
//  Created by 石川 雅之 on 2020/10/24.
//

import SwiftUI

struct ExpandLabelView2: View {
    @ObservedObject var viewModel: ViewModel
    @State private var isExpand: Bool = false

    var body: some View {
        let lineLimit = isExpand ? nil : 2
        let opacity: Double = isExpand ? 0 : 1
        ZStack {
            Text("タップすると全文表示するViewのサンプルです。\n省略時は2行までしか表示されませんが、タップしたら全文表示に切り替わります。\nもう一度タップしたら省略表示に戻ります。\n\nこのViewの高さの変更をViewControllerに伝えて、AutoLayoutの制約を変更します。")
                .lineLimit(lineLimit)
                .padding(.horizontal, 16)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color(red: 1, green: 1, blue: 1, opacity: 0),
                                Color(red: 1, green: 1, blue: 1, opacity: opacity)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .onTapGesture {
                    isExpand.toggle()
                }
                .background(
                    GeometryReader { proxy in
                        Color.clear.preference(key: HeightPreferenceKey.self, value: proxy.size.height)
                    }
                )
        }
        .onPreferenceChange(HeightPreferenceKey.self) { preferences in
            viewModel.send2(height: preferences)
        }
    }
}

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ExpandLabelView2_Previews: PreviewProvider {
    static var previews: some View {
        ExpandLabelView2(viewModel: .init())
    }
}
