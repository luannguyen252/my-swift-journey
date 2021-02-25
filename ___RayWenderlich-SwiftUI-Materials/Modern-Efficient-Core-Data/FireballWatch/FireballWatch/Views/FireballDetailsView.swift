/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI
import MapKit
struct FireballDetailsView: View {
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  @EnvironmentObject private var persistence: PersistenceController
  let fireball: Fireball
  var mapRegion: MKCoordinateRegion {
    let coordinates = CLLocationCoordinate2D(latitude: fireball.latitude, longitude: fireball.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
    return MKCoordinateRegion(center: coordinates, span: span)
  }

  var mapAnnotation: FireballAnnotation {
    return FireballAnnotation(
      coordinates: mapRegion.center,
      color: fireball.impactEnergyMagnitude.color)
  }

  @State var groupPickerIsPresented = false

  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading, spacing: 8) {
          fireball.dateTimeStamp.map { Text(Self.dateFormatter.string(from: $0)) }.font(.headline)
          FireballCoordinateLabel(latitude: fireball.latitude, longitude: fireball.longitude, font: .body)
          FireballImpactEnergyLabel(energy: fireball.impactEnergy, font: .body)
          FireballVelocityLabel(velocity: fireball.velocity, font: .body)
          FireballAltitudeLabel(altitude: fireball.altitude, font: .body)
        }
        Spacer()
        FireballMagnitudeView(magnitude: fireball.impactEnergyMagnitude)
          .frame(width: 100, height: 100)
      }
      .padding()
      FireballMapView(mapRegion: mapRegion, annotations: [mapAnnotation])
    }
    .sheet(isPresented: $groupPickerIsPresented) {
      SelectFireballGroupView(selectedGroups: (fireball.groups as? Set<FireballGroup>) ?? []) {
        setGroups($0)
        groupPickerIsPresented = false
      }
      .environment(\.managedObjectContext, persistence.viewContext)
    }
    .navigationBarTitle(Text("Fireball Details"))
    .navigationBarItems(trailing:
      // swiftlint:disable:next multiple_closures_with_trailing_closure
      Button(action: { groupPickerIsPresented.toggle() }) {
        Image(systemName: "tray.and.arrow.down.fill")
      }
    )
  }

  private func setGroups(_ groups: Set<FireballGroup>) {
    fireball.groups = groups as NSSet
    persistence.saveViewContext()
  }
}

struct FireballDetailsView_Previews: PreviewProvider {
  static var fireball: Fireball {
    let controller = PersistenceController.preview
    return controller.makeRandomFireball(context: controller.viewContext)
  }
  static var previews: some View {
    FireballDetailsView(fireball: fireball)
  }
}
