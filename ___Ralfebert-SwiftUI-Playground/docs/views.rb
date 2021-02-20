#!/bin/env ruby

require 'csv'
require 'mdtable'
require 'pry'
require 'active_support'
require 'active_support/core_ext/object/blank'

views = CSV.parse(File.read("views.csv"), headers: true).map { |row| OpenStruct.new(row) }

links = []

text = ""

data = [['SwiftUI view', 'UIKit View', 'Example']] + views.map { |view|
  swiftui_link = "https://developer.apple.com/documentation/swiftui/#{view.swiftui_view.downcase}"
  
  swiftui_handle = "swiftui-#{view.swiftui_view.downcase}"
  example_handle = "example-#{view.swiftui_view.downcase}"
  example_link = "https://github.com/ralfebert/SwiftUIPlayground/blob/master/SwiftUIPlayground/Views/#{view.example}.swift"
  
  links << "[#{swiftui_handle}]: #{swiftui_link}"
  links << "[#{example_handle}]: #{example_link}"
  
  uikit_link = ""
  uikit_equivalent = unless view.uikit_view.blank?
    uikit_handle = "uikit-#{view.uikit_view.downcase}"
    uikit_link = "https://developer.apple.com/documentation/uikit/#{view.uikit_view.downcase}"
    uikit_link = " ([#{view.uikit_view}](#{uikit_link}) in UIKit)"
    links << "[#{uikit_handle}]: #{uikit_link}"
    "[#{view.uikit_view}][#{uikit_handle}]"
  end
  
  text += "* [#{view.swiftui_view}](#{swiftui_link})#{uikit_link}: [example](#{example_link})\n"
  
  [
    "[#{view.swiftui_view}][#{swiftui_handle}]",
    uikit_equivalent || '',
    %Q{[<img src="docs/#{view.swiftui_view}.png" width="200"/>][#{example_handle}]}
  ]
  
}

puts MDTable.convert(data)
puts "\n"
puts links.join("\n")
puts "\n"
puts "\n"
puts text
