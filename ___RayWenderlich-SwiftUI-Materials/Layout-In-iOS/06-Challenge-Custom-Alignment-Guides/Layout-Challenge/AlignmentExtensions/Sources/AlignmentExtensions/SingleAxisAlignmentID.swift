import SwiftUI

public protocol SingleAxisAlignmentID: AlignmentID {
  associatedtype Alignment
}

public extension View {
  /// Sets the view's horizontal alignment.
  func alignmentGuide<ID: SingleAxisAlignmentID>(_ idType: ID.Type) -> some View
  where ID.Alignment == HorizontalAlignment {
    alignmentGuide(
      HorizontalAlignment(idType),
      computeValue: idType.defaultValue
    )
  }

  /// Sets the view's vertical alignment.
  func alignmentGuide<ID: SingleAxisAlignmentID>(_ idType: ID.Type) -> some View
  where ID.Alignment == VerticalAlignment {
    alignmentGuide(
      VerticalAlignment(idType),
      computeValue: idType.defaultValue
    )
  }
}
