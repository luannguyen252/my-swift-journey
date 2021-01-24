import SwiftUI

struct ContentView: View {
	@State var isAnimating = true
	
	var body: some View {
		ZStack {
			Color.black.edgesIgnoringSafeArea(.all)
			
			Rosace(isAnimating : $isAnimating)
				.blur(radius: isAnimating ? 10 : 0)
				.opacity( isAnimating ? 0 : 0.5)
				.animation(Animation
					.easeInOut(duration: 4)
					.repeatCount(14)
					.delay(1)

			)
			
			Rosace(isAnimating : $isAnimating)
				.animation(Animation.easeInOut(duration: 4).repeatCount(7))
		}
		.onAppear { self.isAnimating.toggle() }
        
	}
}

struct Rosace: View {
	@Binding var isAnimating : Bool
	
	var body: some View {
		ZStack {
			CirclePair(isAnimating: $isAnimating)
			
			CirclePair(isAnimating: $isAnimating)
				.rotationEffect(.degrees(45))

			CirclePair(isAnimating: $isAnimating)
				.rotationEffect(.degrees(-45))
			
		}
		.rotationEffect(.degrees(isAnimating ? 90 : 0))
		.scaleEffect(self.isAnimating ? 0.3 : 1)
	}
}

struct CirclePair: View {
	@Binding var isAnimating: Bool
	
    var body: some View {
		HStack(spacing: 0) {
			BreatheCircle().offset(x: isAnimating ? 30 : 0)
			BreatheCircle().offset(x: isAnimating ? -30 : 0)
		}
	}
}

struct BreatheCircle: View {
	let color = Color(#colorLiteral(red: 0.8174812198, green: 1, blue: 0.8715252876, alpha: 0.1308258929))
    
	var body: some View {
		Circle()
			.fill(color)
			.frame(width : 60, height: 60)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
