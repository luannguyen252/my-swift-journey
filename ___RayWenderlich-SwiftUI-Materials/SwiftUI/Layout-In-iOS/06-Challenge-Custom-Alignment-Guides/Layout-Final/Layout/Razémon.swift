/// Copyright (c) 2019 Razeware LLC
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

import struct CoreGraphics.CGFloat

struct Razémon {
  let name: String
  let description: String
  let cost: Int

  /// 0-1 value describing how far down the eyes are in the Razémon's image
  let eyePosition: CGFloat
}

extension Razémon {
  static let all = [
    Razémon(
      name: "Onetalez",
      description: """
        Uses its tail like a pogo stick, instead of bothering with hind legs.
        Really cuts down on excess weight when climbing your curtains.
        """,
      cost: 999_999_999,
      eyePosition: 0.39
    ),
    Razémon(
      name: "Fënröwlf",
      description: """
        Can change into motörcycle form.
        Otherwise, fluffy as a clöüd!
        """,
      cost: 7777,
      eyePosition: 0.32
    ),
    Razémon(
      name: "Pezzeria Trio",
      description: """
        Pez in the morning.
        Pez in the evening.
        Pez at suppertime!
        """,
      cost: 36,
      eyePosition: 0.24
    ),
    Razémon(
      name: "Beakmon",
      description: """
        Tell me have have you heard about this bird?
        In the lab, his experiments go pop-and-boom.
                                                 OW!
        Wow!
        """,
      cost: 14_12_1951,
      eyePosition: 0.23
    )
  ]
}
