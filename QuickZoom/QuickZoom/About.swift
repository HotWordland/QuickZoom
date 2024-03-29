//
//  About.swift
//  QuickZoom
//
//  Created by 晋先森 on 2021/4/10.
//

import Foundation
import Cocoa

class About {
    
    private static let questions = NSAttributedString(
        string: "If you have any questions, please let me know!",
        attributes: [NSAttributedString.Key.foregroundColor: NSColor.labelColor]
    )
    
    private static var links: NSMutableAttributedString {
        let string = NSMutableAttributedString(string: "GitHub│Support",
                                               attributes: [NSAttributedString.Key.foregroundColor: NSColor.labelColor])
        string.addAttribute(.link, value: "https://github.com/Jinxiansen/QuickZoom", range: NSRange(location: 0, length: 6))
        string.addAttribute(.link, value: "mailto:hi@jinxiansen.com", range: NSRange(location: 7, length: 7))
        return string
    }
    
    private static var credits: NSMutableAttributedString {
        let credits = NSMutableAttributedString(string: "",
                                                attributes: [NSAttributedString.Key.foregroundColor: NSColor.labelColor])
        credits.append(links)
        credits.append(NSAttributedString(string: "\n\n"))
        credits.append(questions)
        credits.setAlignment(.center, range: NSRange(location: 0, length: credits.length))
        return credits
    }
    
    @objc static func openAbout() {
        NSApp.activate(ignoringOtherApps: true)
        var options: [NSApplication.AboutPanelOptionKey : Any] = [:]
        options[.credits] = credits
        if let image = NSImage(named: "icon") {
            options[.applicationIcon] = image
        }
        NSApp.orderFrontStandardAboutPanel(options: options)
    }
}
