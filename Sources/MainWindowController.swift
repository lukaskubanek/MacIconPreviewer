//
//  MainWindowController.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal class MainWindowController: NSWindowController {
    
    @IBOutlet weak var contentView: NSView!
    @IBOutlet internal var dragAreaView: DragAreaView!
    @IBOutlet internal var iconsScrollView: NSScrollView!
    @IBOutlet internal weak var iconsTableView: NSTableView!
    
    internal override func windowDidLoad() {
        contentView.addSubview(dragAreaView)
        
        let constraints = [NSLayoutAttribute.Leading, NSLayoutAttribute.Top, NSLayoutAttribute.Trailing, NSLayoutAttribute.Bottom].map {
            NSLayoutConstraint(item: dragAreaView,
                               attribute: $0,
                               relatedBy: .Equal,
                               toItem: contentView,
                               attribute: $0,
                               multiplier: 1,
                               constant: 0)
        }
        contentView.addConstraints(constraints)
    }

}
