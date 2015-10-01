//
//  DragAreaArrowView.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal class DragAreaArrowView: NSView {
    
    internal override func drawRect(dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.currentContext()?.CGContext else { return }
        
        drawDashedOutlineInContext(context)
        drawArrowInContext(context)
    }
    
    private static let grayColor = CGColorCreateGenericRGB(0.6, 0.6, 0.6, 1)
    private static let lineWidth: CGFloat = 2
    
    private func drawDashedOutlineInContext(context: CGContext) {
        CGContextSaveGState(context)
        
        let inset: CGFloat = 2
        let rect = bounds.insetBy(dx: inset, dy: inset)
        let corner: CGFloat = 15
        let path = CGPathCreateWithRoundedRect(rect, corner, corner, nil)
        CGContextAddPath(context, path)
        
        CGContextSetStrokeColorWithColor(context, DragAreaArrowView.grayColor)
        CGContextSetLineWidth(context, DragAreaArrowView.lineWidth)
        CGContextSetLineDash(context, 0, [6, 6], 2)
        
        CGContextStrokePath(context)
        CGContextRestoreGState(context)
    }
    
    private func drawArrowInContext(context: CGContext) {
        CGContextSaveGState(context)
        
        let headPoint = CGPoint(x: bounds.midX, y: (bounds.minY + bounds.midY)/2)
        let points = [
            CGPoint(x: bounds.midX, y: (bounds.midY + bounds.maxY)/2),
            CGPoint(x: (bounds.minX + bounds.midY)/2 + 5, y: bounds.midY),
            CGPoint(x: (bounds.midX + bounds.maxY)/2 - 5, y: bounds.midY),
        ]
        
        for point in points {
            CGContextMoveToPoint(context, headPoint.x, headPoint.y)
            CGContextAddLineToPoint(context, point.x, point.y)
        }
        
        CGContextSetStrokeColorWithColor(context, DragAreaArrowView.grayColor)
        CGContextSetLineWidth(context, DragAreaArrowView.lineWidth)
        
        CGContextStrokePath(context)
        CGContextRestoreGState(context)
    }
    
}
