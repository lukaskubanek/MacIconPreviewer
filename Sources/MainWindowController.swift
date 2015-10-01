//
//  MainWindowController.swift
//  MacIconPreviewer
//
//  Created by Lukas Kubanek on 01/10/15.
//  Copyright © 2015 Lukas Kubanek. All rights reserved.
//

import Cocoa

internal class MainWindowController: NSWindowController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var contentView: NSView!
    @IBOutlet internal var dragAreaView: DragAreaView!
    
    // The table view (or later collection view) will be used for generating a list of icons
    // for easier switching between them right from the app.
    @IBOutlet internal var iconsScrollView: NSScrollView!
    @IBOutlet internal weak var iconsTableView: NSTableView!
    
    // MARK: - Window Life Cycle
    
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
