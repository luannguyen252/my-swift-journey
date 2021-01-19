//
//  InputCollectionProcessor.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 17.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import UIKit

class SelectableCollectionDelegate: NSObject, UICollectionViewDelegate {
}

class InputCollectionProcessor: SelectableCollectionDelegate {
  private let inputSource: InputCollectionDataSource
  
  var onScrollEnded: (() -> Void)?
  
  init(withSource source: InputCollectionDataSource) {
    inputSource = source
    super.init()
  }
  
  func scrollsToMiddleSection(_ scrollView: UIScrollView) {
    let sectionSize = CGFloat(inputSource.sectionSize) * scrollView.frame.width
    let offset = scrollView.contentOffset.x
    if offset < sectionSize {
      scrollView.setContentOffset(CGPoint(x: offset+sectionSize, y: 0), animated: false)
    }
    if offset >= 2 * sectionSize {
      scrollView.setContentOffset(CGPoint(x: offset-sectionSize, y: 0), animated: false)
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    scrollsToMiddleSection(scrollView)
    onScrollEnded?()
  }
  
  func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    scrollsToMiddleSection(scrollView)
    onScrollEnded?()
  }
  
  func scrollNext(_ scrollView: UIScrollView) {
    let nextOffset = scrollView.contentOffset.x + scrollView.frame.width
    scrollView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
  }
  
  func scrollPrev(_ scrollView: UIScrollView) {
    let nextOffset = scrollView.contentOffset.x - scrollView.frame.width
    scrollView.setContentOffset(CGPoint(x: nextOffset, y: 0), animated: true)
  }
}
