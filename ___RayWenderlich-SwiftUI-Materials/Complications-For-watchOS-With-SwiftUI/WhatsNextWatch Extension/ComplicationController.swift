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

import ClockKit
import SwiftUI

class ComplicationController: NSObject, CLKComplicationDataSource {
  // MARK: - Complication Configuration
  let dataController = AppointmentData(appointments: Appointment.dummyData())

  func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
    let descriptors = [
      CLKComplicationDescriptor(
        identifier: "complication",
        displayName: "WhatsNext",
        supportedFamilies: CLKComplicationFamily.allCases)
      // Multiple complications per app support can be added here with more descriptors
    ]
    handler(descriptors)
  }

  // MARK: - Timeline Configuration
  func getTimelineEndDate(
    for complication: CLKComplication,
    withHandler handler: @escaping (Date?) -> Void
  ) {
    handler(dataController.orderedAppointments.last?.date)
  }

  func getPrivacyBehavior(
    for complication: CLKComplication,
    withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void
  ) {
    handler(.showOnLockScreen)
  }

  // MARK: - Timeline Population
  func getCurrentTimelineEntry(
    for complication: CLKComplication,
    withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void
  ) {
    if let next = dataController.nextAppointment(from: Date()),
      let ctemplate = makeTemplate(for: next, complication: complication) {
      let entry = CLKComplicationTimelineEntry(
        date: next.date,
        complicationTemplate: ctemplate)
      handler(entry)
    } else {
      handler(nil)
    }
  }

  func getTimelineEntries(
    for complication: CLKComplication,
    after date: Date,
    limit: Int,
    withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void
  ) {
    let timeline = dataController.appointments(after: date)
    guard !timeline.isEmpty else {
      handler(nil)
      return
    }

    let fiveMinutes = 5.0 * 60.0
    var entries: [CLKComplicationTimelineEntry] = []
    var current = date
    let endDate = (timeline.last?.date ?? date).addingTimeInterval(Appointment.oneHour)

    while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
      if let next = dataController.nextAppointment(from: current),
        let ctemplate = makeTemplate(for: next, complication: complication) {
        let entry = CLKComplicationTimelineEntry(
          date: current,
          complicationTemplate: ctemplate)
        entries.append(entry)
      }
      current = current.addingTimeInterval(fiveMinutes)
    }
    handler(entries)
  }

  // MARK: - Sample Templates
  func getLocalizableSampleTemplate(
    for complication: CLKComplication,
    withHandler handler: @escaping (CLKComplicationTemplate?) -> Void
  ) {
    let appointment = Appointment.oneDummy(offset: Appointment.oneHour * 0.33)
    let ctemplate = makeTemplate(for: appointment, complication: complication)
    handler(ctemplate)
  }
}

extension ComplicationController {
  func makeTemplate(
    for appointment: Appointment,
    complication: CLKComplication
  ) -> CLKComplicationTemplate? {
    switch complication.family {
    case .graphicCircular:
      return CLKComplicationTemplateGraphicCircularView(
        ComplicationViewCircular(appointment: appointment))
    case .graphicCorner:
      return CLKComplicationTemplateGraphicCornerCircularView(
        ComplicationViewCornerCircular(appointment: appointment))
    case .utilitarianLarge:
      return makeUtilitarianLargeFlat(appointment: appointment)
    case .graphicExtraLarge:
      guard #available(watchOSApplicationExtension 7.0, *) else {
        return nil
      }
      return CLKComplicationTemplateGraphicExtraLargeCircularView(
        ComplicationViewExtraLargeCircular(
          appointment: appointment))
    default:
      return nil
    }
  }
}

extension ComplicationController {
  func makeUtilitarianLargeFlat(appointment: Appointment) -> CLKComplicationTemplateUtilitarianLargeFlat {
    let textProvider = CLKTextProvider(format: "\(appointment.name) in \(appointment.rationalizedTimeUntil())")
    if let bgimage = UIImage.swatchBackground(),
      let fgimage = UIImage.swatchForeground(name: appointment.tag.name),
      let onepiece = UIImage.swatchOnePiece(name: appointment.tag.name) {
      let imageProvider = CLKImageProvider(
        onePieceImage: onepiece,
        twoPieceImageBackground: bgimage,
        twoPieceImageForeground: fgimage)
      let complication = CLKComplicationTemplateUtilitarianLargeFlat(
        textProvider: textProvider,
        imageProvider: imageProvider)
      return complication
    } else {
      let complication = CLKComplicationTemplateUtilitarianLargeFlat(
        textProvider: textProvider)
      return complication
    }
  }
}
