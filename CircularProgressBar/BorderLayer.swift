//
//  BorderLayer.swift
//  CircularProgressBar
//
//  Created by Andres on 9/21/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class BorderLayer: CALayer {
    override func draw(in ctx: CGContext) {
        let lineWidth:CGFloat = 2.0

        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        ctx.beginPath()
        ctx.setStrokeColor(UIColor.blue.cgColor)
        ctx.setLineWidth(lineWidth)
        ctx.addArc(
            center: center,
            radius: bounds.height/2 - lineWidth,
            startAngle: 0,
            endAngle: 2.0 * CGFloat.pi,
            clockwise: false
        )
        ctx.drawPath(using: .stroke)
    }
}
