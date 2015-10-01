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
        
        let inset: CGFloat = 14
        let rect = frame.insetBy(dx: inset, dy: inset)
        let corner: CGFloat = 26
        let path = CGPathCreateWithRoundedRect(rect, corner, corner, nil)
        
        CGContextAddPath(context, path)
        CGContextSetStrokeColorWithColor(context, CGColorCreateGenericRGB(0.8, 0.8, 0.8, 1))
        CGContextSetLineWidth(context, 6)
        CGContextSetLineDash(context, 0, [15, 10], 2)
        CGContextStrokePath(context)
    }
    
}
