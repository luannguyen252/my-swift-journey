//
//  ParkingDetailView.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import SwiftUI
import MapKit

struct ParkingDetailView: View {
    @ObservedObject var parkingFinder: ParkingFinder
    @State var region: MKCoordinateRegion
    @State var showHourSelectionView = false
    @State var selectedHour: CGFloat = 0.0
    
    @State var animate = false
    
    @State var translation: CGFloat = 0.0
    var dragGesture: some Gesture {
        DragGesture().onChanged { value in
            withAnimation { translation = value.translation.height }
        }
        .onEnded { value in
            if value.translation.height > 100 {
                closeCard()
            } else {
                withAnimation { translation = 0.0 }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
                .onTapGesture {
                    // close card
                    closeCard()
                }
            
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.gray)
                    .frame(width: 40, height: 4)
                    .overlay(
                        Rectangle()
                            .fill(Color.black.opacity(0.001))
                            .frame(width: UIScreen.screenWidth - 16, height: 44)
                    )
                    .gesture(dragGesture)
                
                Map(
                    coordinateRegion: $region,
                    annotationItems: [parkingFinder.selectedPlace!]) { spot in
                    MapAnnotation(coordinate: spot.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                        SpotAnnotatonView(fee: "", selected: true)
                    }
                }
                .frame(height: 240)
                .cornerRadius(45)
                .padding(.top, 10)
                
                // parking info view
                ParkingInfoView(parkingItem: parkingFinder.selectedPlace!, showSelectHourView: $showHourSelectionView, selectedHour: $selectedHour)
                    .padding(.vertical, 20)
                // payment view
                PaymentView(selectedHour: $selectedHour, perHourFee: parkingFinder.selectedPlace!.fee)
                    .padding(.bottom, 40)
            }
            .padding()
            .padding(.horizontal, 20)
            .background(Color.lightColor)
            .cornerRadius(40)
            .offset(y: animate ? 0 : UIScreen.screenHeight)
            .offset(y: translation)
            
            if showHourSelectionView {
                HourChangeView(
                    selectedHour: $selectedHour,
                    showHourSliderView: $showHourSelectionView)
            }
        }
        .onAppear {
            withAnimation { animate = true }
        }
    }
    
    func closeCard() {
        withAnimation {
            animate = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                parkingFinder.showDetail = false
                translation = 0.0
            }
        }
    }
}
