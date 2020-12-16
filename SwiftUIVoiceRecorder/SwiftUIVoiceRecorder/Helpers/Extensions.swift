//
//  Extensions.swift
//  SwiftUIVoiceRecorder
//
//  Created by Luan Nguyen on 16/12/2020.
//

import Foundation

extension Date
{
    func toString( dateFormat format : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
