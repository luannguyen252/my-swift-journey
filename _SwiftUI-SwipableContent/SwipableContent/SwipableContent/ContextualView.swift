//
//  ContextualView.swift
//  SwipableContent
//
//  Created by Sudarshan Sharma on 11/26/20.
//

import SwiftUI

struct ContextualView: View {
    let configuration: ContextualViewConfiguration
    let onTapCompletion: (() -> Void)
    
    init(configuration: ContextualViewConfiguration, _ onTapCompletion: @escaping (() -> Void)) {
        self.configuration = configuration
        self.onTapCompletion = onTapCompletion
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 5.0) {
                    if configuration.image != nil {
                        configuration.image!
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18.0, height: 18.0, alignment: .center)
                    }
                    if configuration.text != nil {
                        configuration.text!
                            .font(.body)
                            .truncationMode(.tail)
                            .fixedSize(horizontal: true, vertical: true)
                    }
                }
                .position(x: configuration.contentWidth < 50.0 ? configuration.contentXOffset : geometry.frame(in: .global).width / 2,
                          y: geometry.frame(in: .global).height / 2)
            }
            .foregroundColor(.white)
        }
        .background(configuration.backgroundColor)
        .frame(width: configuration.contentWidth > 0 ? configuration.contentWidth : 0.0)
        .onTapGesture {
            self.onTapCompletion()
        }
    }
}
