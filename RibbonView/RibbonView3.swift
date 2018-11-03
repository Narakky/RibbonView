//
//  RibbonView3.swift
//  RibbonView
//
//  Created by Narakky on 2018/11/03.
//  Copyright © 2018 棤木亮翔. All rights reserved.
//

import UIKit

@IBDesignable
class RibbonView3: UIView {

    override func draw(_ rect: CGRect) {
        //// Color Declarations
        let color3 = UIColor(red: 0.500, green: 0.500, blue: 0.500, alpha: 1.000)

        //// Rectangle Drawing
        /*
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 84, height: 50))
        color3.setFill()
        rectanglePath.fill()
        */
        let bezierPath1 = UIBezierPath()
        bezierPath1.setLines(to: [
            (0, 0),
            (84, 0),
            (84, 100),
            (0, 100)], in: rect.size)
        color3.setFill()
        bezierPath1.fill()


        //// Bezier Drawing
        let bezierPath2 = UIBezierPath()
        /*
        bezierPath2.move(to: CGPoint(x: 84, y: 0))
        bezierPath2.addLine(to: CGPoint(x: 84, y: 25))
        bezierPath2.addLine(to: CGPoint(x: 100, y: 0))
        bezierPath2.addLine(to: CGPoint(x: 84, y: 0))
        */
        bezierPath2.setLines(to: [
            (84, 0),
            (84, 50),
            (100, 0),
            (84, 0)], in: rect.size)
        color3.setFill()
        bezierPath2.fill()

        //// Bezier 2 Drawing
        let bezierPath3 = UIBezierPath()
        /*
        bezierPath3.move(to: CGPoint(x: 84, y: 50))
        bezierPath3.addLine(to: CGPoint(x: 84, y: 25))
        bezierPath3.addLine(to: CGPoint(x: 100, y: 50))
        */
        bezierPath3.setLines(to: [
            (84, 100),
            (84, 50),
            (100, 100),
            (84, 100)], in: rect.size)
        color3.setFill()
        bezierPath3.fill()
    }

}

private extension UIBezierPath {

    func setLines(to percentages: [(CGFloat, CGFloat)], in drawSize: CGSize) {
        percentages.forEach { percentage in
            if percentages.first! == percentage {
                move(to: point(of: percentage, in: drawSize))
            } else {
                addLine(to: point(of: percentage, in: drawSize))
            }
        }
        close()
    }

    private func point(of percentage: (CGFloat, CGFloat), in drawSize: CGSize) -> CGPoint {
        return CGPoint(
            x: percentage.0 / 100 * drawSize.width,
            y: percentage.1 / 100 * drawSize.height
        )
    }
}
