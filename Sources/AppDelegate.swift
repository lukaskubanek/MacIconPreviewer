//
//  AppDelegate.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

@NSApplicationMain
internal class AppDelegate: NSObject, NSApplicationDelegate {
    
    internal lazy var mainWindowController: MainWindowController = {
        return MainWindowController(windowNibName: "MainWindowController")
    }()
    
    internal func applicationDidFinishLaunching(notification: NSNotification) {
        mainWindowController.showWindow(nil)
    }
    
}
