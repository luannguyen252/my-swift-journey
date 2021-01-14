//
//  Line.swift
//  LLDB
//
//  Created by Clarence Ji on 6/6/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI

struct Line: Hashable, Codable, Identifiable {
    
    var id: String
    var name: String
    var lineStatuses: [Status]
    
    struct Status: Hashable, Codable, Identifiable {
        var id: Int
        var statusSeverity: Int
        var statusSeverityDescription: String
        var reason: String?
        
        var worseThanSevereDelay: Bool {
            return statusSeverity <= 6
        }
    }
    
    var isGoodService: Bool {
        return shortStatus.lowercased() == "good service"
    }
    
    var shortStatus: String {
        return topStatus?.statusSeverityDescription ?? ""
    }
    
    var reason: String? {
        return topStatus?.reason ?? ""
    }
    
    var statusColor: Color {
        
        if isGoodService {
            return .green
        }
        
        if topStatus?.worseThanSevereDelay == true {
            return .red
        }
        
        return .orange
        
    }
    
    var statusIcon: Image {
        
        if isGoodService {
            return Image(systemName: "checkmark.circle.fill")
        }
        
        if topStatus?.worseThanSevereDelay == true {
            return Image(systemName: "xmark.circle.fill")
        }
        
        return Image(systemName: "exclamationmark.circle.fill")
        
    }
    
    var lineColor: Color {
        return Color(id)
    }
    
    private var topStatus: Status? {
        return lineStatuses.sorted(by: { $0.statusSeverity < $1.statusSeverity }).first
    }
    
}
