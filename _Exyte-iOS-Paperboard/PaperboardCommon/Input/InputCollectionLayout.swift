//
//  InputCollectionLayout.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 16.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import UIKit

class InputCollectionLayout: UICollectionViewLayout {
  @IBInspectable var spacing: NSNumber = 4 {
    didSet {
      self.collectionView?.reloadData()
    }
  }
  
  weak var inputSource: InputCollectionDataSource?
  
  private var items = [IndexPath: CGRect]()
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

    guard let bounds = collectionView?.bounds, let source = inputSource else {
      return nil
    }
    let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    attributes.frame = items[indexPath] ?? CGRect.zero
    
    return attributes
  }
  
  override var collectionViewContentSize: CGSize {
    guard let frame = collectionView?.frame, let source = inputSource else { return CGSize.zero }
    return CGSize(width: frame.width * CGFloat(source.sections.count), height: frame.height)
  }
  
  override func prepare() {
    super.prepare()
    guard let bounds = collectionView?.bounds, let source = inputSource else {
      return
    }
    
    let cgSpacing = CGFloat(spacing.floatValue)

    items.removeAll()
    for section in source.sections.enumerated() {
      let sectionSize = section.element.size
      let cellWidth = (bounds.width - CGFloat(sectionSize - 1) * cgSpacing) / CGFloat(sectionSize)
      let cellHeight = (bounds.height - CGFloat(sectionSize - 1) * cgSpacing) / CGFloat(sectionSize)
      let sectionPad = bounds.width * CGFloat(section.offset)
      for item in section.element.values.indices {
        let row: Int = item / sectionSize
        let column: Int = item % sectionSize
        let path = IndexPath(item: item, section: section.offset)
        items[path] = CGRect(x: CGFloat(column) * (cellWidth + cgSpacing) + sectionPad, y: CGFloat(row) * (cellHeight + cgSpacing), width: cellWidth, height: cellHeight)
      }
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return items.filter({ $0.value.intersects(rect) }).map{ pair -> UICollectionViewLayoutAttributes in
      let attr = UICollectionViewLayoutAttributes(forCellWith: pair.key)
      attr.frame = pair.value
      return attr
    }
  }
}
