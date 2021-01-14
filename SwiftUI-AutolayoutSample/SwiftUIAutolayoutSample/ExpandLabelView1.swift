//
//  ExpandLabelView1.swift
//  SwiftUIAutolayoutSample
//
//  Created by usayuki on 2020/10/17.
//

import SwiftUI

struct ExpandLabelView1: View {
    @ObservedObject var viewModel: ViewModel
    @State private var isExpand: Bool = false

    var body: some View {
        let lineLimit = isExpand ? nil : 2
        let opacity: Double = isExpand ? 0 : 1
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
            .background(GeometryReader { proxy -> Text in
                viewModel.send1(height: proxy.size.height)
                return Text("")
            })
    }
}

struct ExpandLabelView1_Previews: PreviewProvider {
    static var previews: some View {
        ExpandLabelView1(viewModel: .init())
    }
}
