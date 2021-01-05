//
//  MenuManager.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Cocoa

class MenuManager: NSObject {

    private let statusItem = NSStatusBar.system
        .statusItem(withLength: NSStatusItem.variableLength)
    private let button: NSStatusBarButton
    private let runners: NSMenu
    private let runnerlayer = RunnerLayer()

    private var ao: NSKeyValueObservation?
    private let dm = DataManager.shared
    private var timer: Timer?
    private var cpu: CPU? = CPU()
    private var isDark: Bool = false

    init(menu: NSMenu) {
        statusItem.menu = menu
        self.button = statusItem.button!
        self.runners = menu.item(withTag: 0)!.submenu!
        super.init()

        button.wantsLayer = true
        ao = button.superview!.observe(\.effectiveAppearance, changeHandler: { [weak self] (_, _) in
            self?.updateIsDark()
        })
        runnerlayer.initialize(gap: button.bounds.width / 2.0)
        button.layer!.addSublayer(runnerlayer)
        if #available(macOS 10.16, *) {
            // do nothing currently
        } else if #available(macOS 10.15, *) {
            button.contentTintColor = NSColor.textColor
        }
        menu.item(withTag: 1)?.state = dm.showCPU ? .on : .off

        updateIndicator()
        updateMenuItems(meta: dm.meta)
        updateIsDark()
        updateSpeed()
    }

    deinit {
        sleep()
        ao?.invalidate()
    }

    private func updateIsDark() {
        let newIsDark = button.superview!.effectiveAppearance.isDark
        if #available(macOS 10.15, *) {
            button.appearance = NSAppearance(named: newIsDark ? .darkAqua : .aqua)
        }
        if runnerlayer.hasSequence && isDark == newIsDark { return }
        isDark = newIsDark
        setImages(meta: dm.meta)
    }

    func sleep() {
        timer?.invalidate()
        timer = nil
        cpu = nil
    }

    func wake() {
        cpu = CPU()
        startTimer()
    }

    private func updateIndicator() {
        button.image = IndicatorManager
            .createIndicator(cpu: (dm.showCPU ? cpu?.usage().description : nil))
    }

    func toggledIndications(showCPU: Bool) {
        dm.showCPU = showCPU
        updateIndicator()
        runnerlayer.updateFrame(button.bounds)
    }

    private func updateMenuItems(meta: RunnerMeta) {
        self.runners.items.forEach { (item) in
            item.state = .off
            if item.tag == meta.id {
                item.state = .on
            }
        }
    }

    func selectRunner(meta: RunnerMeta) {
        dm.meta = meta
        updateMenuItems(meta: meta)
        setImages(meta: meta)
    }

    // MARK: Image
    private func setImages(meta: RunnerMeta) {
        var icons = [NSImage]()
        for i in (0 ..< 10) {
            var icon = NSImage(name: "\(meta.imageTag)\(i)")
            if isDark && meta.template {
                icon = icon.inverted
            }
            icon = icon.with(paddingLeft: 2.0)
            icon.isTemplate = meta.template
            icons.append(icon)
        }
        runnerlayer.setSequence(icons, button.bounds)
    }

    // MARK: Animation
    private func updateSpeed() {
        let speed = Float(max(1.0, min(20.0, (cpu?.usage().value ?? 0.0) / 5.0)))
        runnerlayer.updateSpeed(speed, button.bounds)
    }

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.updateIndicator()
            self.updateSpeed()
        }
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }

}
