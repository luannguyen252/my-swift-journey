import SwiftUI

struct ActivityRings: View {
    @ObservedObject var healthKit: HealthKitController

    var body: some View {
        ZStack {
            ActivityRing(
                ringColor: .move,
                ringWidth: 14,
                current: $healthKit.moveCurrent,
                goal: $healthKit.moveGoal
            )
            .frame(width: 110, height: 110)
            ActivityRing(
                ringColor: .exercise,
                ringWidth: 14,
                current: $healthKit.exerciseCurrent,
                goal: $healthKit.exerciseGoal
            )
            .frame(width: 78, height: 78)
            ActivityRing(
                ringColor: .stand,
                ringWidth: 14,
                current: $healthKit.standCurrent,
                goal: $healthKit.standGoal
            )
            .frame(width: 46, height: 46)
        }
    }
}

struct ActivityRings_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRings(healthKit: HealthKitController())
    }
}
