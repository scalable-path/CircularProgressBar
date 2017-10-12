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

    static let startAngle = 3/2 * CGFloat.pi
    static let endAngle = 7/2 * CGFloat.pi

    let darkBorderLayer = BorderLayer()
    let progressBorderLayer = BorderLayer()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBInspectable var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }

    @IBInspectable var subtitle: String = "" {
        didSet {
            subtitleLabel.text = subtitle
        }
    }

    @IBInspectable var progress: CGFloat = 0.0 {
        didSet {
            print(progress)
            print(progressBorderLayer.endAngle)
            progressBorderLayer.endAngle = CircularProgressBar.radianForValue(progress)
        }
    }

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
        progressBorderLayer.frame = self.bounds

        progressBorderLayer.setNeedsDisplay()
        darkBorderLayer.setNeedsDisplay()
    }

    open func commonInit() {
        darkBorderLayer.lineColor = UIColor(
            red: 134/255,
            green: 133/255,
            blue: 148/255,
            alpha: 1
        ).cgColor
        darkBorderLayer.startAngle = CircularProgressBar.startAngle
        darkBorderLayer.endAngle = CircularProgressBar.endAngle
        self.layer.addSublayer(darkBorderLayer)

        progressBorderLayer.lineColor = UIColor(
            red: 168/255,
            green: 207/255,
            blue: 45/255,
            alpha: 1
        ).cgColor
        progressBorderLayer.startAngle = CircularProgressBar.startAngle
        progressBorderLayer.endAngle = CircularProgressBar.endAngle
        self.layer.addSublayer(progressBorderLayer)
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

    internal class func radianForValue(_ value: CGFloat) -> CGFloat {
        let realValue = CircularProgressBar.sanitizeValue(value)
        return (realValue * 4/2 * CGFloat.pi / 100) + CircularProgressBar.startAngle
    }

    internal class func sanitizeValue(_ value: CGFloat) -> CGFloat {
        var realValue = value
        if value < 0 {
            realValue = 0
        } else if value > 100 {
            realValue = 100
        }
        return realValue
    }

}
