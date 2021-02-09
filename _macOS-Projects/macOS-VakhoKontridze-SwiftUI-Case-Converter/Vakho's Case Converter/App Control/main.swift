//
//  main.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/12/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Cocoa

let appDelegate: AppDelegate = .init()
NSApplication.shared.delegate = appDelegate

private let appMenu: NSMenu = AppMenu(settings: appDelegate.settings)
NSApplication.shared.mainMenu = appMenu

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
