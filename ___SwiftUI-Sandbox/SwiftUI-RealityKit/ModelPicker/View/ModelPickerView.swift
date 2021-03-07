//
//  ModelPickerView.swift
//  ModelPicker
//
//  Created by Fernando Fernandes on 24.07.20.
//

import SwiftUI

struct ModelPickerView: View {
    
    // MARK: - Properties

    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var models: [Model]
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(models, id: \.self) { model in
                    Button {
                        print("Picked model: \(model.modelName)")
                        selectedModel = model
                        isPlacementEnabled = true
                    } label: {
                        Image(uiImage: model.image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background( Color.white)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}
