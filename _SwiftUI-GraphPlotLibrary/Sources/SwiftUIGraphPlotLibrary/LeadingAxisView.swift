//
//  LeadinAxixView.swift
//  cool1
//
//  Created by 観周 横尾 on 15/04/2020.
//  Copyright © 2020 midleemaster. All rights reserved.
//

import SwiftUI

public struct LeadingAxisView:View {
    let dataSet:[PlotData]
    let height:CGFloat
    let counter:Int
    let stringFormat:String
    
    init(dataSet:[PlotData], height:CGFloat, counter:Int = 5, format:String = "%.1f") {
        self.dataSet = dataSet
        self.height = height
        self.counter = counter
        self.stringFormat = format
    }
    
    var max:CGFloat {
        dataSet.max(\.y) ?? height
    }
    var min:CGFloat {
        dataSet.min(\.y) ?? 0.0
    }
    
    var dy :CGFloat {
        return (max - min) / CGFloat(counter)
    }
    var offSetDy:CGFloat {
        return height / CGFloat(counter)
    }
    
    func culcOffsetY(_ index: Int) -> CGFloat {
        return self.height * 0.5 - self.offSetDy * CGFloat(index)
    }
    
    func lavel(at index:Int) -> String {
        let num = self.min + dy *  CGFloat(index)
        return String(format: self.stringFormat, num)
    }
    public var body: some View{
        ZStack(alignment: .trailing){
            ForEach(Array(0...counter ), id: \.self) { index in
                YAxixNumbers(text:self.lavel(at: index), offsetY: self.culcOffsetY(index))
            }
        }.frame(height: self.height)
        
    }
}

struct YAxixNumbers:View {
    let text:String
    let offsetY:CGFloat
    
    var body: some View{
        Text(self.text)
            .font(.footnote)
            .fontWeight(.thin)
            .frame(alignment: .trailing)
            .offset( y: self.offsetY)
    }
}

struct LeadinAxixView_Previews: PreviewProvider {
    
    static var previews: some View {
        let plotset:[PlotData] = [PlotData(x: 0,y: 0),PlotData(x: 1.0,y: 2.0),PlotData(x: 2.0,y: 3.0),PlotData(x: 3.0,y: 2.0),PlotData(x: 4.0,y: 7.0),PlotData(x: 40.0,y: 20.0)]
       return LeadingAxisView(dataSet: plotset, height: 200)
    }
}

