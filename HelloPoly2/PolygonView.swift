//
//  PolygonView.swift
//  HelloPoly2
//
//  Created by Maeve Lynskey on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit


class PolygonView: UIView {
    var delegate: PolygonProtocol? = nil
    var lineWidth: Float = 1.0
    var strokeColor: UIColor = UIColor.gray
    var fillColor: UIColor = UIColor.blue.withAlphaComponent(0.5)

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        
        let insetRect = rect.insetBy(dx: CGFloat(lineWidth / 1.0), dy: CGFloat(lineWidth / 1.0))
        
        if let vertices = delegate?.pointsInRect(rect: insetRect) {
            fillColor.setFill()
            strokeColor.setStroke()
            
            let path = UIBezierPath()
            path.move(to: vertices[0])
            
            for vertex in vertices[1..<vertices.count] {
                path.addLine(to: vertex)
            }
            
            path.close()
            path.fill()
            path.stroke()
        }
    }
}
