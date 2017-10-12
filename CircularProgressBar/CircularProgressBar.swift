//
//  CircularProgressBar.swift
//  CircularProgressBar
//
//  Created by Andres on 9/19/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

@IBDesignable
open class CircularProgressBar: UIView {
    var view: UIView!
    let darkBorderLayer = BorderLayer()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        commonInit()
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        darkBorderLayer.frame = self.bounds

        darkBorderLayer.setNeedsDisplay()
    }

    open func commonInit() {
        darkBorderLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.layer.addSublayer(darkBorderLayer)
    }

    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView

        view.frame = bounds

        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
        self.view = view
    }
}
