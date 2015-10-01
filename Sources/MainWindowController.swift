//
//  MainWindowController.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal class MainWindowController: NSWindowController {
    
    internal lazy var dragAreaWindowController: DragAreaWindowController = {
        let controller = DragAreaWindowController(windowNibName: "DragAreaWindowController")
        controller.delegate = self
        return controller
    }()
    
    internal override func windowDidLoad() {
        if let dragAreaWindow = dragAreaWindowController.window {
            window?.beginSheet(dragAreaWindow, completionHandler: nil)
        }
    }

}

extension MainWindowController: DragAreaWindowControllerDelegate {
    
    internal func didDismissDragAreaWindowController(controller: DragAreaWindowController) {
        if let dragAreaWindow = dragAreaWindowController.window {
            window?.endSheet(dragAreaWindow)
        }
    }
    
}
