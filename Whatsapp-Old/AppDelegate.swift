//
//  AppDelegate.swift
//  Whatsapp-Old
//
//  Created by David Empire on 2/15/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Set the delegate for the main window to listen for window events.
        // Assuming your app has a single main window and it's the first in the array of windows.
        if let mainWindow = NSApplication.shared.windows.first {
            mainWindow.delegate = self
            restoreWindowSizeAndPosition(window: mainWindow)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // No need to save the window size here if you're saving it when the window moves or resizes.
    }
    
    // Restore the window size and position
    func restoreWindowSizeAndPosition(window: NSWindow) {
        let userDefaults = UserDefaults.standard
        if let windowFrameString = userDefaults.string(forKey: "MainWindowFrame") {
            window.setFrame(NSRectFromString(windowFrameString), display: true)
        }
    }

    // NSWindowDelegate method: called when the window is moved or resized
    func windowDidMove(_ notification: Notification) {
        saveWindowSizeAndPosition(notification: notification)
    }
    
    func windowDidResize(_ notification: Notification) {
        saveWindowSizeAndPosition(notification: notification)
    }

    // Save the window size and position
    func saveWindowSizeAndPosition(notification: Notification) {
        if let window = notification.object as? NSWindow {
            let userDefaults = UserDefaults.standard
            userDefaults.set(NSStringFromRect(window.frame), forKey: "MainWindowFrame")
        }
    }
}
