import SwiftUI

struct UISliderView: UIViewRepresentable {
    @Binding var value: Double
    var onEditingEnd: () -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = CustomSlider()
        slider.value = 10
        slider.setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        slider.setThumbImage(UIImage(named: "sliderSelectedThumb"), for: .highlighted)
        slider.minimumTrackTintColor = UIColor(named: "zSliderTrackColor")
        slider.maximumTrackTintColor = UIColor(named: "zSliderTrackColor")
                
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateValue(sender:)),
            for: .valueChanged)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.endEditing),
            for: .touchUpInside)
           
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<UISliderView>) {
        uiView.value = Float(value / 20.0)
    }
    
    class Coordinator: NSObject {
        var sliderView: UISliderView
        
        init(_ sliderView: UISliderView) {
            self.sliderView = sliderView
        }
        
        @objc func updateValue(sender: UISlider) {
            sliderView.value = Double(sender.value * 20)
        }
        
        @objc func endEditing() {
            sliderView.onEditingEnd()
        }
    }
}

class CustomSlider: UISlider {
   override func trackRect(forBounds bounds: CGRect) -> CGRect {
         let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 8))
         super.trackRect(forBounds: customBounds)
         return customBounds
     }
}
