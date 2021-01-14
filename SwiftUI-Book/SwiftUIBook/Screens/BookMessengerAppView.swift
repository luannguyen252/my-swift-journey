//
//  BookMessengerAppView.swift
//  SwiftUIBook
//
//  Created by muukii on 2020/07/06.
//  Copyright © 2020 muukii. All rights reserved.
//

import SwiftUI

/// https://dribbble.com/shots/6499682-messages

struct BookMessengerAppView: BookView {
  var body: some View {
    ZStack {

      Color.black
      VStack {
        ZStack {

          Color.black

          VStack {
            HStack {
              Text("Messages")
                .font(.title)
                .foregroundColor(Color.white)
              Spacer()
              Color.gray
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .frame(width: 36, height: 36)
            }
            .padding(24)

            ScrollView(.horizontal) {

              HStack {

                Color.clear
                  .frame(width: 24, height: 0)

                ForEach(0..<10) { _ in
                  VStack {

                    Mocks.Images.human
                      .frame(width: 60, height: 60)
                      .clipShape(Circle())

                    Text("Name")
                      .foregroundColor(Color.white)

                  }

                }

                Color.clear
                  .frame(width: 24, height: 0)

              }

            }

          }

        }


        ZStack {
          Color.white

          VStack {
            HStack {
              Text("Recent")
              Spacer()
              Text("Options")
            }

            ScrollView {
              LazyVStack {
                ForEach(0..<10) { _ in

                  HStack {
                    Mocks.Images.human
                      .frame(width: 60, height: 60)
                      .clipShape(Circle())

                    VStack {
                      Text("Name")
                      Text("Name")
                    }

                    Spacer()

                    VStack {
                      Text("5m")

                      Color(.systemPink)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .frame(width: 28, height: 28)
                        .overlay(Text("1").foregroundColor(.white))
                    }

                  }

                }
              }
            }
          }
          .padding(24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))

      }

    }
    .edgesIgnoringSafeArea(.all)
  }

}

struct BookMessengerAppView_Previews: PreviewProvider {
  static var previews: some View {
    BookMessengerAppView()
  }
}
