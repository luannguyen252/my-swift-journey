//
//  MainMenu.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 9/9/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Cocoa

// MARK:- App Menu
final class AppMenu: NSMenu {
    // MARK: Properties
    private var settings: SettingsViewModel!
    
    
    // MARK: Initializers
    override init(title: String) {
        super.init(title: title)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    convenience init(settings: SettingsViewModel) {
        self.init(title: "Default")
        self.settings = settings
    }
    
    private func commonInit() {
        items = [
            createMainMenu(),
            createConvertMenu(),
            createEditMenu(),
            createWindowMenu(),
            createHelpMenu()
        ]
    }
}

// MARK:- Sub Items
private extension AppMenu {
    func createMainMenu() -> NSMenuItem {
        let menu: NSMenuItem = .init()
        
        menu.submenu = .init(title: "MainMenu")
        menu.submenu?.items = [
            .init(title: "About \(AppDelegate.appName)", hotkey: nil, action: #selector(NSApplication.orderFrontStandardAboutPanel(_:))),
            
            .separator(),
            
//            .init(title: "Preferences...", hotkey: .init(.command, ","), action: ???),

//            .separator(),
            
            .init(title: "Hide \(AppDelegate.appName)", hotkey: .init(.command, "h"), action: #selector(NSApplication.hide(_:))),
            .init(title: "Hide Others", hotkey: .init(.optionCommand, "h"), action: #selector(NSApplication.hideOtherApplications(_:))),
            .init(title: "Show All", hotkey: nil, action: #selector(NSApplication.unhideAllApplications(_:))),
            
            .separator(),
            
            .init(title: "Quit \(AppDelegate.appName)", hotkey: .init(.command, "q"), action: #selector(NSApplication.shared.terminate(_:)))
        ]
        
        return menu
    }
    
    func createConvertMenu() -> NSMenuItem {
        let menu: NSMenuItem = .init()

        menu.submenu = .init(title: "Convert")
        menu.submenu?.items = [
            .init(in: self, title: "Convert", hotkey: nil, action: #selector(convert)),

            .separator(),

            .init(title: "Case", hotkey: nil, subItems: [
                .init(in: self, title: "Lowercase", hotkey: .init(.command, "1"), action: #selector(changeCaseToLower)),
                .init(in: self, title: "Uppercase", hotkey: .init(.command, "2"), action: #selector(changeCaseToUpper)),
                .separator(),
                .init(in: self, title: "Title Case", hotkey: .init(.command, "3"), action: #selector(changeCaseToTitle)),
                .init(in: self, title: "Sentence Case", hotkey: .init(.command, "4"), action: #selector(changeCaseToSentence)),
                .init(in: self, title: "Capital Case", hotkey: .init(.command, "5"), action: #selector(changeCaseToCaital)),
                .separator(),
                .init(in: self, title: "Alternate Case", hotkey: .init(.command, "6"), action: #selector(changeCaseToAlternate)),
                .init(in: self, title: "Toggle Case", hotkey: .init(.command, "7"), action: #selector(changeCaseToToggle))
            ]),
            .init(in: self, title: "Change Case", hotkey: .init(.command, "0"), action: #selector(changeCase))
        ]

        return menu
    }

    func createEditMenu() -> NSMenuItem {
        let menu: NSMenuItem = .init()

        menu.submenu = .init(title: "Edit")
        menu.submenu?.items = [
//            .init(title: "Undo", hotkey: .init(.command, "z"), action: #selector(UndoManager.undo)),
//            .init(title: "Redo", hotkey: .init(.shiftCommand, "z"), action: #selector(UndoManager.redo)),

//            .separator(),

            .init(title: "Cut", hotkey: .init(.command, "x"), action: #selector(NSText.cut(_:))),
            .init(title: "Copy", hotkey: .init(.command, "c"), action: #selector(NSText.copy(_:))),
            .init(title: "Paste", hotkey: .init(.command, "v"), action: #selector(NSText.paste(_:))),

            .separator(),

            .init(title: "Select All", hotkey: .init(.command, "a"), action: #selector(NSText.selectAll(_:)))

            // Separator

            // Start dictating
            // Emoji
        ]

        return menu
    }

    func createWindowMenu() -> NSMenuItem {
        let menu: NSMenuItem = .init()

        menu.submenu = .init(title: "Window")
        menu.submenu?.items = [
            .init(in: self, title: "Minimize", hotkey: .init(.command, "m"), action: #selector(minimize)),
            .init(in: self, title: "Zoom", hotkey: nil, action: #selector(zoom)),
            .init(in: self, title: "Enter/Exit Full Screen", hotkey: .init(.optionCommand, "f"), action: #selector(fullscreen)),

            .separator(),

            .init(title: "Close Window", hotkey: .init(.command, "w"), action: #selector(NSApp.keyWindow?.performClose(_:))),

            .separator(),
            
            .init(in: self, title: "Main...", hotkey: nil, action: #selector(creaetMainWindow)),
            .init(in: self, title: "Special Words...", hotkey: nil, action: #selector(creaetSpecialWordsWindow)),
            
            .separator(),

            .init(title: "Bring All to Front", hotkey: nil, action: #selector(NSApplication.arrangeInFront(_:)))
        ]

        return menu
    }

    func createHelpMenu() -> NSMenuItem {
        let menu: NSMenuItem = .init()

        menu.submenu = .init(title: "Help")
        menu.submenu?.items = [
            // Search

            .init(in: self, title: "Contact Developer", hotkey: nil, action: #selector(contactDeveloper))
        ]

        return menu
    }
}

// MARK:- Selectors
private extension AppMenu {
    @objc func minimize() {
        guard [SpecialWordsWindow.shared.windowID, CustomWordsWindow.shared.windowID].contains(NSApp.keyWindow?.identifier) else { return }
        NSApp.keyWindow?.performMiniaturize(nil)
    }
    @objc func zoom() {
        guard [SpecialWordsWindow.shared.windowID, CustomWordsWindow.shared.windowID].contains(NSApp.keyWindow?.identifier) else { return }
        NSApp.keyWindow?.performZoom(nil)
    }
    @objc func fullscreen() {
        guard [SpecialWordsWindow.shared.windowID, CustomWordsWindow.shared.windowID].contains(NSApp.keyWindow?.identifier) else { return }
        NSApp.keyWindow?.toggleFullScreen(nil)
    }
    
    @objc func creaetMainWindow() { MainWindow.shared.createWindow() }
    @objc func creaetSpecialWordsWindow() { SpecialWordsWindow.shared.createWindow() }
    
    @objc func convert() { settings.convert() }
    
    @objc func changeCaseToLower() { settings.conversionCase = .lower }
    @objc func changeCaseToUpper() { settings.conversionCase = .upper }
    @objc func changeCaseToTitle() { settings.conversionCase = .title }
    @objc func changeCaseToSentence() { settings.conversionCase = .sentence }
    @objc func changeCaseToCaital() { settings.conversionCase = .capital }
    @objc func changeCaseToAlternate() { settings.conversionCase = .alternate }
    @objc func changeCaseToToggle() { settings.conversionCase = .toggle }
    
    @objc func changeCase() { settings.conversionCase.nextCase() }
    
    @objc func contactDeveloper() {
        guard let service = NSSharingService(named: NSSharingService.Name.composeEmail) else { return }
        service.recipients = ["vakho.kontridze@gmail.com"]
        service.subject = ""
        service.perform(withItems: [])
    }
}

// MARK:- Helpers
private extension NSMenuItem {
    convenience init(
        title: String,
        hotkey: HotKey?,
        action selector: Selector?
    ) {
        self.init(title: title, action: selector, keyEquivalent: hotkey?.key ?? "")
        self.keyEquivalentModifierMask = hotkey?.modifier.flags ?? []
    }
    
    convenience init(
        in target: AnyObject,
        title: String,
        hotkey: HotKey?,
        action selector: Selector?
    ) {
        self.init(title: title, hotkey: hotkey, action: selector)
        self.target = target
    }
    
    convenience init(
        title: String,
        hotkey: HotKey?,
        subItems: [NSMenuItem]
    ) {
        self.init(title: "\(title)...", hotkey: hotkey, action: nil)
        submenu = {
            let subMenu: NSMenu = .init()
            subMenu.items.append(contentsOf: subItems)
            return subMenu
        }()
    }
}

// MARK:- Hot Key
private struct HotKey {
    let modifier: Modifier
    let key: String
    
    init(_ modifier: Modifier, _ key: String) {
        self.modifier = modifier
        self.key = key
    }
    
    enum Modifier {
        case command
        case control
        
        case shiftCommand
        case optionCommand
        case controlCommand
        
        case optionShiftCommand
        case controlShiftCommand
        
        var flags: NSEvent.ModifierFlags {
            switch self {
            case .command: return [.command]
            case .control: return [.control]
            
            case .shiftCommand: return [.shift, .command]
            case .optionCommand: return [.option, .command]
            case .controlCommand: return [.control, .command]
                
            case .optionShiftCommand: return [.option, .shift, .command]
            case .controlShiftCommand: return [.control, .shift, .command]
            }
        }
    }
}
