//
//  WindowFactory.swift
//  Vakho's Natural Sorter
//
//  Created by Vakhtang Kontridze on 9/21/20.
//

import Foundation
import SwiftUI

// MARK:- Window Factory
class WindowFactory: NSObject {
    private var window: NSWindow!
    private var windowController: NSWindowController!
    
    private var rect: WindowRect!
    
    var windowID: NSUserInterfaceItemIdentifier? { window?.identifier }
}

// MARK:- Lifecycle Methods
extension WindowFactory {
    func createWindow<Factory>(sender: Factory) where Factory: WindowFactoryable & NSWindowDelegate {
        // If window exists, brings it to front
        guard window == nil else { window.makeKeyAndOrderFront(nil); return }
        
        // Creates rect
        rect = .init(
            key: sender.rootView.name,
            savesOrigin: sender.rect.savesOrigin,
            savesSize: sender.rect.savesSize,
            defaultSize: sender.rect.defaultSize
        )
        
        // Creates window
        window = .init(
            contentRect: rect.frame,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false,
            screen: nil
        )
        window.makeKeyAndOrderFront(nil)

        // Customizes title bar
        window.titlebarAppearsTransparent = sender.titleBar.isTransparent

        window.title = sender.titleBar.title

        window.standardWindowButton(.closeButton)?.isHidden = !sender.titleBar.titleButtons.contains(.close)
        window.standardWindowButton(.closeButton)?.isEnabled = sender.titleBar.titleButtons.contains(.close)

        window.standardWindowButton(.miniaturizeButton)?.isHidden = !sender.titleBar.titleButtons.contains(.miniaturize)
        window.standardWindowButton(.miniaturizeButton)?.isEnabled = sender.titleBar.titleButtons.contains(.miniaturize)

        window.standardWindowButton(.zoomButton)?.isHidden = !sender.titleBar.titleButtons.contains(.zoom)
        window.standardWindowButton(.zoomButton)?.isEnabled = sender.titleBar.titleButtons.contains(.zoom)

        // Creates view
        window.contentView = NSHostingView(rootView: sender.rootView)

        // Creates window controller
        windowController = .init(window: window)

        // Sets delegate
        window.delegate = sender
    }

    func saveFrame(_ notification: Notification) {
        guard notification.object as? NSWindow == window else { return }

        if window.styleMask.contains(.fullScreen) { window.toggleFullScreen(nil) }
        rect.saveFrame(window.frame)

        window = nil
        windowController = nil
    }
}

// MARK:- Window Factoryable
protocol WindowFactoryable {
    associatedtype Content: View
    var rootView: Content { get }
    
    var rect: WindowRectParameters { get }
    
    var titleBar: WindowFactoryTitleBarSettings { get }
}

// MARK:- Window Factory TitleBar Settings
struct WindowFactoryTitleBarSettings {
    let title: String
    
    let isTransparent: Bool

    let titleButtons: Set<TitleButton>
    enum TitleButton { case close, zoom, miniaturize }
}

// MARK:- Window Rect
class WindowRect {
    // MARK: Properties
    var frame: CGRect {
        let size: CGSize = {
            if savesSize, let width = width.value, let height = height.value {
                return .init(width: width, height: height)
            } else {
                return defaultSize
            }
        }()
        
        let origin: CGPoint = {
            if savesOrigin, let x = x.value, let y = y.value {
                return .init(x: x, y: y)
            } else {
                return centeredOrigin(from: size)
            }
        }()
        
        return .init(origin: origin, size: size)
    }
    
    private var x, y: UserDefault<CGFloat>
    private func centeredOrigin(from size: CGSize) -> CGPoint {
        .init(
            x: NSScreen.main!.frame.size.width / 2 - size.width / 2,
            y: NSScreen.main!.frame.size.height / 2 - size.height / 2
        )
    }
    private let savesOrigin: Bool
    
    private var width, height: UserDefault<CGFloat>
    private var defaultSize: CGSize
    private let savesSize: Bool
    
    // MARK: Initializers
    init(
        key: String,
        savesOrigin: Bool,
        savesSize: Bool, defaultSize: CGSize
    ) {
        self.defaultSize = defaultSize
        
        self.x = .init(key: "\(key)X")
        self.y = .init(key: "\(key)Y")
        self.savesOrigin = savesOrigin
        
        self.width = .init(key: "\(key)W")
        self.height = .init(key: "\(key)H")
        self.savesSize = savesSize
    }
    
    // MARK: Methods
    func saveFrame(_ frame: CGRect) {
        if savesOrigin {
            x.value = frame.minX
            y.value = frame.minY
        }
        
        if savesSize {
            width.value = frame.width
            height.value = frame.height
        }
    }
}

// MARK:- Window Rect Parameters
struct WindowRectParameters {
    // MARK: Properties
    let savesOrigin: Bool
    
    let defaultSize: CGSize
    let savesSize: Bool
    
    // MARK: Initializers
    init(
        savesOrigin: Bool = true,
        savesSize: Bool = true, defaultSize: CGSize
    ) {
        self.savesOrigin = savesOrigin
        
        self.defaultSize = defaultSize
        self.savesSize = savesSize
    }
}

// MARK:- User Defaults
private struct UserDefault<Value> {
    // MARK: Properties
    let key: String
    
    private var _value: Value?
    var value: Value? {
        get {
            _value
        }
        set {
            _value = newValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    // MARK: Initializers
    init(key: String) {
        self.key = key
        
        if key.isSavedInDefaults, let value = UserDefaults.standard.object(forKey: key) as? Value {
            self._value = value
        } else {
            self._value = nil
        }
    }
}

// MARK:- Helpers
private extension View {
    var name: String {
        "\(type(of: self))"
    }
}

private extension String {
    var isSavedInDefaults: Bool {
        UserDefaults.standard.object(forKey: self) != nil
    }
}
