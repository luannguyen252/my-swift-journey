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

struct TemperatureChart: Chart {
  let measurements: [DayInfo]
  let renderDegrees: Bool
  let renderMonthNames: Bool

  init(measurements: [DayInfo]) {
    self.init(
      measurements: measurements,
      renderDegrees: true,
      renderMonthNames: true
    )
  }

  init(
    measurements: [DayInfo],
    renderDegrees: Bool,
    renderMonthNames: Bool
  ) {
    self.measurements = measurements
    self.renderDegrees = renderDegrees
    self.renderMonthNames = renderMonthNames
  }

  let tempGradient = Gradient(
    colors: [
      .purple,
      .init(red: 0, green: 0, blue: 139.0 / 255),
      .blue,
      .init(red: 30.0 / 255, green: 144.0 / 255, blue: 1),
      .init(red: 0, green: 191.0 / 255, blue: 1),
      .init(red: 135.0 / 255, green: 206.0 / 255, blue: 250.0 / 255),
      .green,
      .yellow,
      .orange,
      .init(red: 1, green: 140.0 / 255, blue: 0),
      .red,
      .init(red: 139.0 / 255, green: 0, blue: 0)
    ]
  )
}

// MARK: - private
private extension TemperatureChart {
  static func degreeHeight(_ height: CGFloat, range: Int) -> CGFloat {
    height / .init(range)
  }
  
  static func dayWidth(_ width: CGFloat, count: Int) -> CGFloat {
    width / .init(count)
  }
  
  static func dayOffset(_ date: Date, dWidth: CGFloat) -> CGFloat {
    .init(Calendar.current.ordinality(of: .day, in: .year, for: date)!)
      * dWidth
  }
  
  static func tempOffset(_ temperature: Double, degreeHeight: CGFloat) -> CGFloat {
    .init(temperature + 10) * degreeHeight
  }
  
  static func tempLabelOffset(_ line: Int, height: CGFloat) -> CGFloat {
    height - tempOffset(
      Double(line * 10),
      degreeHeight: degreeHeight(height, range: 110)
    )
  }
  
  static func offsetFirstOfMonth(_ month: Int, width: CGFloat) -> CGFloat {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yyyy"
    let foM = dateFormatter.date(from: "\(month)/1/2018")!
    let dayWidth = Self.dayWidth(width, count: 365)
    return dayOffset(foM, dWidth: dayWidth)
  }
  
  static func monthAbbreviationFromInt(_ month: Int) -> String {
    Calendar.current.shortMonthSymbols[month - 1]
  }
}

// MARK: - View
extension TemperatureChart: View {
  var body: some View {
    GeometryReader { reader in
      ForEach(measurements) { measurement in
        Path { path in
          let dayWidth = Self.dayWidth(reader.size.width, count: 365)
          let degreeHeight = Self.degreeHeight(reader.size.height, range: 110)
          let dayOffset = Self.dayOffset(measurement.date, dWidth: dayWidth)
          let lowOffset = Self.tempOffset(measurement.low, degreeHeight: degreeHeight)
          let highOffset = Self.tempOffset(measurement.high, degreeHeight: degreeHeight)
          path.move(to: .init(x: dayOffset, y: reader.size.height - lowOffset))
          path.addLine(to: .init(x: dayOffset, y: reader.size.height - highOffset))
        }
        .stroke(
          LinearGradient(
            gradient: tempGradient,
            startPoint: .init(x: 0, y: 1),
            endPoint: .init(x: 0, y: 0)
          )
        )
      }

      if renderDegrees {
        Degrees(size: reader.size)
      }

      if renderMonthNames {
        MonthNames(size: reader.size)
      }
    }
  }
}

struct TemperatureChart_Previews: PreviewProvider {
  static var previews: some View {
    TemperatureChart(
      measurements: [WeatherStation]()[2].measurements
    )
  }
}

private struct Degrees: View {
  let size: CGSize

  var body: some View {
    ForEach(-1..<11) { line in
      Group {
        Path { path in
          let y = TemperatureChart.tempLabelOffset(line, height: size.height)
          path.move(to: CGPoint(x: 0, y: y))
          path.addLine(to: CGPoint(x: size.width, y: y))
        }
        .stroke(line == 0 ? Color.black : .gray)

        if line >= 0 {
          Text("\(line * 10)°")
            .offset(
              x: 10,
              y: TemperatureChart.tempLabelOffset(line, height: size.height)
            )
        }
      }
    }
  }
}

private struct MonthNames: View {
  let size: CGSize

  var body: some View {
    ForEach(1..<13) { month in
      Group {
        Path { path in
          let dOffset = TemperatureChart.offsetFirstOfMonth(month, width: size.width)

          path.move(to: CGPoint(x: dOffset, y: size.height))
          path.addLine(to: CGPoint(x: dOffset, y: 0))
        }.stroke(Color.gray)
        Text("\(TemperatureChart.monthAbbreviationFromInt(month))")
          .font(.subheadline)
          .offset(
            x: TemperatureChart.offsetFirstOfMonth(month, width: size.width)
              + 5 * TemperatureChart.dayWidth(size.width, count: 365),
            y: size.height - 25
          )
      }
    }
  }
}
