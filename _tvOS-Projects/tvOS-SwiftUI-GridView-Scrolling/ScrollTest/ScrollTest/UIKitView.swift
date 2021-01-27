//
//  UIKitView.swift
//  ScrollTest
//
//  Created by Daniel Saidi on 2020-11-09.
//

import Foundation
import UIKit
import SwiftUI

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var itemView: AnyView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: VerticalLayout())
        collection.dataSource = self
        collection.delegate = self
        collection.register(ListRow.self, forCellWithReuseIdentifier: "Cell")
        collectionView = collection
        view.addSubview(collection, fill: true)
    }
    
    var collectionView: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let row = cell as? ListRow else { return cell }
        row.itemView = itemView
        //cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return false
    }
}

class ListRow: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var itemView: AnyView!
    
    override func didMoveToWindow() {
        guard subviews.count == 0 else { return }
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(ListItem.self, forCellWithReuseIdentifier: "Cell")
        collectionView = collection
        addSubview(collection, fill: true)
    }
    
    let layout = HorizontalLayout()
    var collectionView: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override var canBecomeFocused: Bool { false }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("HEJ")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let item = cell as? ListItem else { return cell }
        //cell.backgroundColor = .yellow
        item.itemView = itemView
        return cell
    }
}

class ListItem: UICollectionViewCell {
    
    var itemView: AnyView!
    
    override var canBecomeFocused: Bool { true }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        subviews.forEach { $0.removeFromSuperview() }
        let view = UIHostingController(rootView: itemView).view
        addSubview(view!)
        if isFocused {
            backgroundColor = .green
        } else {
            backgroundColor = .red
        }
    }
}

class VerticalLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        itemSize = CGSize(width: UIScreen.main.bounds.width, height: 400)
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        scrollDirection = .vertical
    }
}


class HorizontalLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        itemSize = CGSize(width: 380, height: 380)
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        scrollDirection = .horizontal
    }
}

public extension UIView {
    
    var hasSubviews: Bool {
        return subviews.count > 0
    }
    
    func addSubview(_ subview: UIView, fill: Bool) {
        addSubview(subview)
        guard fill else { return }
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func addSubviewBottommost(_ view: UIView) {
        guard let first = subviews.first else { return addSubview(view) }
        insertSubview(view, belowSubview: first)
    }
    
    func addSubviewTopmost(_ view: UIView) {
        guard let last = subviews.last else { return addSubview(view) }
        insertSubview(view, aboveSubview: last)
    }
    
    func removeSubviews(_ subviews: [UIView]) {
        subviews.forEach { $0.removeFromSuperview() }
    }
}
