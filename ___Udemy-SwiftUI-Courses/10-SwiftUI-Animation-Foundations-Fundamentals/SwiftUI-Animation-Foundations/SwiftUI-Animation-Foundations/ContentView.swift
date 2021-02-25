import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Section 1 + 2: Introduction & Getting Started").font(.system(size: 14))) {
                    NavigationLink(destination: Introduction()) {
                        Text("Introduction")
                    }
                    NavigationLink(destination: HowToAnimate()) {
                        Text("How to animate")
                    }
                    NavigationLink(destination: CountUpTimer()) {
                        Text("Count up timer")
                    }
                }
                Section(header: Text("Section 3: Core Animation Techniques").font(.system(size: 14))) {
                    NavigationLink(destination: AnimateObjectRotation()) {
                        Text("Animate Object Rotation")
                    }
                    NavigationLink(destination: AnimateObjectScale()) {
                        Text("Animate Object Scale")
                    }
                    NavigationLink(destination: AnimateObjectMove()) {
                        Text("Animate Object Move")
                    }
                    NavigationLink(destination: AnimateObjectColor()) {
                        Text("Animate Object Color")
                    }
                    NavigationLink(destination: PulsatingAnimation()) {
                        Text("Pulsating Animation")
                    }
                    NavigationLink(destination: AnimateObjectTransparency()) {
                        Text("Animate Object Transparency")
                    }
                    NavigationLink(destination: AnimateObjectCorner()) {
                        Text("Animate Object Corner")
                    }
                }
                Section(header: Text("Section 4: Basic SwiftUI Animation").font(.system(size: 14))) {
                    NavigationLink(destination: BreathAnimation()) {
                        Text("Breath Animation")
                    }
                    NavigationLink(destination: GlowingLoader()) {
                        Text("Glowing Loader")
                    }
                    NavigationLink(destination: HueRotation()) {
                        Text("Hue Rotation")
                    }
                    NavigationLink(destination: OrientOnPath()) {
                        Text("Orient On Path")
                    }
                    NavigationLink(destination: ProceedWithTouchID()) {
                        Text("Proceed With TouchID")
                    }
                }
                Section(header: Text("Section 5: Animating Shape Properties").font(.system(size: 14))) {
                    NavigationLink(destination: CustomShape()) {
                        Text("Custom Shape")
                    }
                    NavigationLink(destination: CustomShape2()) {
                        Text("Custom Shape 2")
                    }
                }
                Section(header: Text("Section 6: Designing Spring Animations").font(.system(size: 14))) {
                    NavigationLink(destination: SpringAnimation()) {
                        Text("Spring Animation")
                    }
                    NavigationLink(destination: InteractiveSpringAnimation()) {
                        Text("Interactive Spring Animation")
                    }
                    NavigationLink(destination: InterpolatingSpringAnimation()) {
                        Text("Interpolating Spring Animation")
                    }
                    NavigationLink(destination: SpringAnimationParameters()) {
                        Text("Spring Animation Parameters")
                    }
                    NavigationLink(destination: MassSpringAnimation()) {
                        Text("Mass Spring Animation")
                    }
                    NavigationLink(destination: StiffnessSpringAnimation()) {
                        Text("Stiffness Spring Animation")
                    }
                    NavigationLink(destination: DampingSpringAnimation()) {
                        Text("Damping Spring Animation")
                    }
                    NavigationLink(destination: InitialVelocitySpringAnimation()) {
                        Text("Initial Velocity Spring Animation")
                    }
                    NavigationLink(destination: SpringParameterResponseDampingFractionBlendDuration()) {
                        Text("Spring Parameter Response Damping Fraction Blend Duration")
                    }
                    NavigationLink(destination: BouncingAnimation()) {
                        Text("Bouncing Animation")
                    }
                }
                Section(header: Text("Section 7: Applying and Animating Masks").font(.system(size: 14))) {
                    NavigationLink(destination: WiFiConnection()) {
                        Text("Wi-Fi Connection")
                    }
                }
                Section(header: Text("Section 8: Creating Gestural Interactions").font(.system(size: 14))) {
                    NavigationLink(destination: LongPressGestureTouchID()) {
                        Text("Long Press Gesture TouchID")
                    }
                    NavigationLink(destination: AudioMetering()) {
                        Text("Audio Metering")
                    }
                }
                Section(header: Text("Section 9: Design and Prototype Using iPad").font(.system(size: 14))) {
                    Text("Design and Prototype on iPad")
                }
                Section(header: Text("Section 10, 11: 3D Animation, Breath Animation").font(.system(size: 14))) {
                    NavigationLink(destination: Animating3DRotationXYAxes()) {
                        Text("Animating 3D Rotation XY Axes")
                    }
                    NavigationLink(destination: BreathAnchorInCenter()) {
                        Text("Breath Anchor In Center")
                    }
                    NavigationLink(destination: JustBreath()) {
                        Text("Just Breath")
                    }
                    NavigationLink(destination: FlowerAnimation()) {
                        Text("Flower Animation")
                    }
                }
                Section(header: Text("Section 12: SwiftUI Animation Technique").font(.system(size: 14))) {
                    NavigationLink(destination: FacebookLiveAnimation()) {
                        Text("Facebook Live Animation")
                    }
                }
            }
            .navigationBarTitle("SwiftUI Animations")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
