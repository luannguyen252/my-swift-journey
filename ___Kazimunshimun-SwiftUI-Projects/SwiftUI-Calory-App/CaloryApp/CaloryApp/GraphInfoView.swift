//
//  GraphInfoView.swift
//  CaloryApp
//
//  Created by Anik on 30/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct GraphInfoView: View {
    let width: CGFloat
    var body: some View {
        VStack {
            Spacer()
            WaveView()
                .frame(width: 194, height: 194)
            //Spacer(minLength: 30)
            NumberDataView(name: "kcal left", value: "3,456", isGramPresent: false, nameFontSize: 15, valueFontSize: 54)
            Spacer()
            CaloryGraphView(graphViewModel: CaloryDataViewModel())
            Spacer()
        }
        .frame(width: width - width / 2.5)
        .background(ColorConstants.todayViewGradientColor)
    }
}

struct WaveView: View {
    var body: some View {
        ZStack {
            Wave(graphWidth: 0.4, amplitude: 0.1).fill(ColorConstants.todayViewGradientColor)
            Wave(graphWidth: 0.4, amplitude: 0.1)
                .offset(x: 40)
                .opacity(0.1)
        }
            .background(Color.white)
            .cornerRadius(97)
            .foregroundColor(ColorConstants.endColor)
        
    }
}

struct CaloryGraphView: View {
    let graphViewModel: CaloryDataViewModel
    var body: some View {
        HStack(alignment: .bottom, spacing: 14) {
            ForEach (self.graphViewModel.data, id: \.self) { dayData in
                DataItemView(data: dayData)
                
            }
        }
    }
}

struct CaloryData: Hashable {
    let dayOfWeek: String
    let value: CGFloat
}

struct GraphInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GraphInfoView(width: 340)
    }
}

struct DataItemView: View {
    let data: CaloryData
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 9, height: data.value)
            Text(data.dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 10))
        }
    }
}
