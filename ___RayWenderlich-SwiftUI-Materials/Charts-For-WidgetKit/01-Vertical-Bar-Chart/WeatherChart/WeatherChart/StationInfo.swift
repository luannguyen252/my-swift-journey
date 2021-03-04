/// Copyright (c) 2021 Razeware LLC
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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct StationInfo {
  let station: WeatherStation
}

// MARK: - View
extension StationInfo: View {
  var body: some View {
    VStack {
      StationHeader(station: station)
        .padding()
      TabView {
        Tab<TemperatureChart>(
          title: "Temperatures",
          measurements: station.measurements,
          systemImage: "thermometer"
        )
        Tab<SnowfallChart>(
          title: "Snowfall",
          measurements: station.measurements,
          systemImage: "snow"
        )
        Tab<PrecipitationChart>(
          title: "Precipitation",
          measurements: station.measurements,
          systemImage: "cloud.rain"
        )
      }
    }
    .navigationBarTitle(
      Text(station.name),
      displayMode: .inline
    )
  }
}

private struct Tab<Chart: WeatherChart.Chart> {
  let title: String
  let measurements: [DayInfo]
  let systemImage: String
}

extension Tab: View {
  var body: some View {
    VStack {
      Text("\(title) for 2018")
      Chart(measurements: measurements)
    }
    .tabItem {
      Label(title, systemImage: systemImage)
    }
  }
}

struct StationInfo_Previews: PreviewProvider {
  static var previews: some View {
    StationInfo(station: [WeatherStation]()[0])
  }
}

