//
//  COVID19ListView.swift
//  COVID-19 WatchKit Extension
//
//  Created by michael.chan on 23/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import SwiftUI

public struct COVID19ListView: View {
    
    @ObservedObject public var model = COVID19ListViewModel()
    
    public var body: some View {
            
        ScrollView {
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Spacer()
                    
                    Text("\(model.lastUpdated.value)").multilineTextAlignment(.trailing)

                }.padding(.horizontal, 10)
                
                COVID19SummaryCountView(type: .total, count: model.totalCount.value)
                
                #if os(watchOS)
                
                    COVID19SummaryCountView(type: .deaths, count: model.deathCount.value)
                    COVID19SummaryCountView(type: .recovered, count: model.recoveredCount.value)

                #else
                
                    HStack(alignment: .center) {
                        
                        COVID19SummaryCountView(type: .deaths, count: model.deathCount.value)
                        COVID19SummaryCountView(type: .recovered, count: model.recoveredCount.value)
                        
                    }
                    
                #endif
                
                ForEach(model.countries.value) { country in
                    
                    COVID19CountryInformationRow(country: country)
                    
                }
                
            }.padding(.horizontal, 10)
            
        }.contextMenu {
            
            Button(action: {
                self.model.changeSorting(to: .alphabetical)
            }, label: {
                Text("Alphabetical")
            })
            Button(action: {
                self.model.changeSorting(to: .deaths)
            }, label: {
                VStack {
                    Image("Healthcare-Skull-icon").resizable().aspectRatio(contentMode: .fit).frame(height: 30, alignment: .center)
                    Text("Deaths")
                }
            })
            Button(action: {
                self.model.changeSorting(to: .recovered)
            }, label: {
                VStack {
                    Image("cross-green").resizable().aspectRatio(contentMode: .fit).frame(height: 30, alignment: .center)
                    Text("Recovered")
                }
            })
            
        }.onAppear {

            self.model.getData()

        }
        
    }
    
    public init() {
        
    }
    
}

struct WatchCOVID19ListView_Previews: PreviewProvider {
    static var previews: some View {
        COVID19ListView()
    }
}
