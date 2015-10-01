//
//  DragAreaView.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal class DragAreaView: NSView {
    
    internal override func drawRect(dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.currentContext()?.CGContext else { return }
        
        CGContextSetFillColorWithColor(context, CGColorCreateGenericGray(1, 1))
        CGContextFillRect(context, dirtyRect)
    }
    
}
