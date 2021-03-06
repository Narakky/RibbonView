//
//  RibbonView.swift
//  RibbonView
//
//  Created by Narakky on 2018/11/03.
//  Copyright © 2018 棤木亮翔. All rights reserved.
//

import UIKit

@IBDesignable
class RibbonView: UIView {

    override func draw(_ rect: CGRect) {

        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 180, height: 80))
        UIColor.gray.setFill()
        rectanglePath.fill()

        //// Symbol Drawing
        context.saveGState()
        context.translateBy(x: 153, y: 80)

        let symbolRect = CGRect(x: 0, y: -80, width: 27, height: 80)
        context.saveGState()
        context.clip(to: symbolRect)
        context.translateBy(x: symbolRect.minX, y: symbolRect.minY)

        RibbonView.drawCanvas2(frame: CGRect(origin: .zero, size: symbolRect.size), resizing: .stretch)
        context.restoreGState()

        context.restoreGState()

    }

    @objc dynamic public class func drawCanvas2(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 34, height: 80), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 34, height: 80), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 34, y: resizedFrame.height / 80)


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 34, y: 0))
        bezierPath.addLine(to: CGPoint(x: 0, y: 40))
        bezierPath.addLine(to: CGPoint(x: 34, y: 80))
        bezierPath.addLine(to: CGPoint(x: 34, y: 0))
        UIColor.white.setFill()
        bezierPath.fill()

        context.restoreGState()
    }

    @objc(StyleKitNameResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }

}
