//
//  DragAreaWindowController.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal protocol DragAreaWindowControllerDelegate: class {
    
    func didDismissDragAreaWindowController(controller: DragAreaWindowController)
    
}

internal class DragAreaWindowController: NSWindowController {
    
    internal weak var delegate: DragAreaWindowControllerDelegate?
    
    @IBOutlet internal weak var dragAreaView: DragAreaView!
        
    @IBAction internal func dismiss(sender: AnyObject) {
        delegate?.didDismissDragAreaWindowController(self)
    }
    
}
