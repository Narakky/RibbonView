//
//  RibbonView2.swift
//  RibbonView
//
//  Created by Narakky on 2018/11/03.
//  Copyright © 2018 棤木亮翔. All rights reserved.
//

import UIKit

@IBDesignable
class RibbonView2: UIView {

    override func draw(_ rect: CGRect) {
        //// General Declarations
//        let context = UIGraphicsGetCurrentContext()!

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 180, height: 80))
        UIColor.gray.setFill()
        rectanglePath.fill()

        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 34, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 40))
        bezierPath.addLine(to: CGPoint(x: 34, y: 80))
        bezierPath.addLine(to: CGPoint(x: 34, y: 0))
        UIColor.white.setFill()
        bezierPath.fill()
    }

}
