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

import Foundation
import CoreData
import UIKit

typealias ImpactEnergyMagnitude = Int

extension ImpactEnergyMagnitude {
  // a color to represent the magnitude of the impact energey
  var color: UIColor {
    switch self {
    case 0:
      return UIColor(hue: 0.6, saturation: 0.8, brightness: 0.64, alpha: 1)
    case 1:
      return UIColor(hue: 0.56, saturation: 0.9, brightness: 0.51, alpha: 1)
    case 2:
      return UIColor(hue: 0.52, saturation: 0.55, brightness: 0.63, alpha: 1)
    case 3:
      return UIColor(hue: 0.18, saturation: 0.43, brightness: 0.73, alpha: 1)
    case 4:
      return UIColor(hue: 0.11, saturation: 0.65, brightness: 0.93, alpha: 1)
    case 5:
      return UIColor(hue: 0.09, saturation: 0.67, brightness: 0.92, alpha: 1)
    case 6:
      return UIColor(hue: 0.05, saturation: 0.72, brightness: 0.88, alpha: 1)
    case 7:
      return UIColor(hue: 0.02, saturation: 0.78, brightness: 0.83, alpha: 1)
    case 8:
      return UIColor(hue: 0.01, saturation: 0.80, brightness: 0.81, alpha: 1)
    default:
      return UIColor.lightGray
    }
  }
}

extension Fireball {
  // an internal scale from 0 to 8 to represent the scale of the impact energey
  var impactEnergyMagnitude: ImpactEnergyMagnitude {
    let logEnergy = log(impactEnergy)
    switch logEnergy {
    case (-1 ... -0.5):
      return 1
    case (-0.5 ... 0):
      return 2
    case 0...0.5:
      return 3
    case 0.5...1:
      return 5
    case 1...1.5:
      return 5
    case 1.5...2:
      return 6
    case 2...2.5:
      return 7
    case _ where logEnergy > 2.5:
      return 8
    default:
      // where logEnergy < -1:
      return 0
    }
  }
}
