//
//  Component.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI

public protocol Component: View {
    associatedtype Props
    
    var props: Props { get }
    
    init(props: Props)
}
