# SwiftUI Animation Foundations: Fundamentals

> Designing SwiftUI Animations and Motion

---

[SwiftUI Animation Foundations: Fundamentals](https://www.udemy.com/course/swiftui-animation-foundations/)

An interpolating spring animation that uses a damped spring model to produce values in the range [0, 1] that are then used to interpolate within the [from, to] range of the animated property. Preserves velocity across overlapping animations by adding the effects of each animation.
- Parameters:
	- mass: The mass of the object attached to the spring.
	- stiffness: The stiffness of the spring.
	- damping: The spring damping value.
	- initialVelocity: the initial velocity of the spring, as a value in the range [0, 1] representing the magnitude of the value being animated.
	- Returns: a spring animation.