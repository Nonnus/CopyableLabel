//
//  CopyableLabel.swift
//
//  Created by Nonnus on 03.09.18.
//  Copyright © 2018 Silicon Studios. All rights reserved.
//

import Foundation
import UIKit

public class CopyableLabel: UILabel {

    var menuController = UIMenuController.shared
    var pasteboard = UIPasteboard.general

    @IBInspectable var isCopyable: Bool = true {
        didSet { updateGestureRecognizer() }
    }

    override public var canBecomeFirstResponder: Bool { return isCopyable }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateGestureRecognizer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateGestureRecognizer()
    }

    private func updateGestureRecognizer() {
        isUserInteractionEnabled = isCopyable
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showMenu(sender:)))
        isCopyable ? addGestureRecognizer(gestureRecognizer) : removeGestureRecognizer(gestureRecognizer)
    }

    @objc private func showMenu(sender: AnyObject?) {
        becomeFirstResponder()
        if !menuController.isMenuVisible {
            menuController.setTargetRect(bounds, in: self)
            menuController.setMenuVisible(true, animated: true)
        }
    }

    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(copy(_:))
    }

    override public func copy(_ sender: Any?) {
        pasteboard.string = text
        menuController.setMenuVisible(false, animated: true)
    }
}
