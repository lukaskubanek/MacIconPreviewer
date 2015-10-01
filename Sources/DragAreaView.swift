//
//  DragAreaView.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal class DragAreaView: NSView {
    
    // MARK: - Initialization
    
    internal override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        configure()
    }
    
    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    private func configure() {
        registerForDraggedTypes([NSFilenamesPboardType])
    }
    
    // MARK: - Visual State
    
    private var highlighted = false {
        didSet {
            needsDisplay = true
        }
    }
    
    // MARK: - Drawing
    
    internal override func drawRect(dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.currentContext()?.CGContext else { return }
        
        CGContextSetFillColorWithColor(context, CGColorCreateGenericGray(1, 1))
        CGContextFillRect(context, dirtyRect)
        
        if highlighted {
            CGContextSetStrokeColorWithColor(context, CGColorCreateGenericRGB(0.62, 0.71, 1, 0.6))
            CGContextSetLineWidth(context, 3)
            CGContextStrokeRect(context, bounds.insetBy(dx: 1.5, dy: 1.5))
        }
    }
    
    // MARK: - Dragging
    
    internal override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        let pasteboard = sender.draggingPasteboard()
        let sourceOperation = sender.draggingSourceOperationMask()
        
        if NSImage.canInitWithPasteboard(pasteboard) && sourceOperation.contains(.Copy) {
            highlighted = true
            
            return .Copy
        } else {
            return .None
        }
    }
    
    internal override func draggingExited(sender: NSDraggingInfo?) {
        highlighted = false
    }
    
    internal override func prepareForDragOperation(sender: NSDraggingInfo) -> Bool {
        highlighted = false
        
        let pasteboard = sender.draggingPasteboard()
        
        return NSImage.canInitWithPasteboard(pasteboard)
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        let pasteboard = sender.draggingPasteboard()
        
        guard let image = NSImage(pasteboard: pasteboard) else { return false }
        let URLString = NSURL(fromPasteboard: pasteboard)?.absoluteString ?? "unknown file"
        
        NSApp.applicationIconImage = image
        Swift.print("Setting icon to \(URLString)")
        
        return true
    }
    
}
