//
//  BottomAxisView.swift
//  cool1
//
//  Created by 観周 横尾 on 15/04/2020.
//  Copyright © 2020 midleemaster. All rights reserved.
//

import SwiftUI

public struct BottomAxisView: View {
    let dataSet:[PlotData]
    let lendth:CGFloat
    let counter:Int
    let stringFormat:String
    
    init(dataSet:[PlotData], lendth:CGFloat, counter:Int = 5, format:String = "%.1f") {
        self.dataSet = dataSet
        self.lendth = lendth
        self.counter = counter
        self.stringFormat = format
    }
    
    var max:CGFloat {
        dataSet.max(\.x) ?? lendth
    }
    var min:CGFloat {
        dataSet.min(\.x) ?? 0.0
    }
      
    var dx :CGFloat {
        return (max - min) / CGFloat(counter)
    }
    // The edge of x-axis on geometry reader frame
    var xAxisRangeOnGeometry:CGFloat {
        return lendth * 0.9
    }
    var offSetDx:CGFloat {
        return xAxisRangeOnGeometry / CGFloat(counter)
    }
      
    func culcOffsetY(_ index: Int) -> CGFloat {
        return  self.offSetDx * CGFloat(index) - lendth * 0.5
    }
      
    func lavel(at index:Int) -> String {
        let num = self.min + dx *  CGFloat(index)
        return String(format:self.stringFormat, num)
    }
    public var body: some View{
        ZStack(alignment: .trailing){
            ForEach(Array(0...counter ), id: \.self) { index in
                XAxixNumbers(text:self.lavel(at: index), offsetX: self.culcOffsetY(index))
            }
        }.frame(width : self.lendth)
    }
}

struct XAxixNumbers:View {
    let text:String
    let offsetX:CGFloat
    
    var body: some View{
        Text(self.text)
            .font(.footnote)
            .fontWeight(.thin)
            .frame(alignment: .leading)
            .offset( x: self.offsetX)
    }
}

struct BottomAxisView_Previews: PreviewProvider {
     
    static var previews: some View {
        let plotset:[PlotData] = [PlotData(x: 0,y: 0),PlotData(x: 1.0,y: 2.0),PlotData(x: 2.0,y: 3.0),PlotData(x: 3.0,y: 2.0),PlotData(x: 4.0,y: 7.0),PlotData(x: 40.0,y: 20.0)]
        return BottomAxisView(dataSet: plotset, lendth: 300)
    }
}

