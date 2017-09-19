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
    }

    open func commonInit() { }

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
