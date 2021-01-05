//
//  AppDelegate.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var menu: NSMenu!

    var mm: MenuManager!
    private var sleepObserver: NSObjectProtocol?
    private var wakeObserver: NSObjectProtocol?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setNotifications()
        mm = MenuManager(menu: menu)
        mm.startTimer()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        finishNotifications()
    }

    @IBAction func selectRunner(_ sender: NSMenuItem) {
        if let meta = RunnerMeta(id: sender.tag) {
            mm.selectRunner(meta: meta)
        }
    }


    @IBAction func toggleShowCpuUsage(_ sender: NSMenuItem) {
        let showCPU: Bool = (sender.state != .on)
        sender.state = showCPU ? .on : .off
        mm.toggledIndications(showCPU: showCPU)
    }


    @IBAction func openActivityMonitor(_ sender: NSMenuItem) {
        NSWorkspace.shared.launchApplication(
            withBundleIdentifier: "com.apple.ActivityMonitor",
            options: .default,
            additionalEventParamDescriptor: nil,
            launchIdentifier: nil)
    }

    @IBAction func openTheUhooiPage(_ sender: NSMenuItem) {
        guard let url = URL(string: "https://theuhooi.com/") else { return }
        NSWorkspace.shared.open(url)
    }

    @IBAction func openAbout(_ sender: NSMenuItem) {
        NSApp.activate(ignoringOtherApps: true)
        let url = "https://github.com/Kyome22/RunUhooi"
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let mutableAttrStr = NSMutableAttributedString()
        let attrNormal: [NSAttributedString.Key : Any] = [
            .paragraphStyle: style,
            .foregroundColor: NSColor.textColor
        ]
        let attrUrl: [NSAttributedString.Key : Any] = [
            .paragraphStyle: style,
            .foregroundColor: NSColor.url, .link : url
        ]
        mutableAttrStr.append(NSAttributedString(string: "licensed".localized, attributes: attrNormal))
        mutableAttrStr.append(NSAttributedString(string: "oss".localized, attributes: attrNormal))
        mutableAttrStr.append(NSAttributedString(string: url, attributes: attrUrl))
        let key = NSApplication.AboutPanelOptionKey.credits
        NSApp.orderFrontStandardAboutPanel(options: [key: mutableAttrStr])
    }

    private func setNotifications() {
        let wsnc = NSWorkspace.shared.notificationCenter
        sleepObserver = wsnc.addObserver(
            forName: NSWorkspace.willSleepNotification,
            object: nil, queue: nil, using: { [weak self] (_) in
                self?.mm.sleep()
        })
        wakeObserver = wsnc.addObserver(
            forName: NSWorkspace.didWakeNotification,
            object: nil, queue: nil, using: { [weak self] (_) in
                self?.mm.wake()
        })
    }

    private func finishNotifications() {
        let wsnc = NSWorkspace.shared.notificationCenter
        if sleepObserver != nil {
            wsnc.removeObserver(sleepObserver!)
        }
        if wakeObserver != nil {
            wsnc.removeObserver(wakeObserver!)
        }
    }

}

