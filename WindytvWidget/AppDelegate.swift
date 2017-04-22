//
//  AppDelegate.swift
//  WindytvWidget
//
//  Created by Břetislav Štěpán on 22.04.17.
//  Copyright © 2017 Břetislav Štěpán. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let app = NSApplication.shared()
        app.terminate(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

