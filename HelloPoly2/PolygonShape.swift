//
//  PolygonShape.swift
//  HelloPoly2
//
//  Created by Maeve Lynskey on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit

protocol PolygonProtocol {
    func pointsInRect(rect: CGRect) -> [CGPoint]
}

class PolygonShape: NSObject, PolygonProtocol {
    
    func pointsInRect(rect: CGRect) -> [CGPoint] {
        let center = rect.center
        let radius = min(rect.size.width, rect.size.height) / 2.0
        let arc = 2 * CGFloat.pi / CGFloat(numberOfSides)
        var vertexArray = [CGPoint]()
        for i in 0..<numberOfSides {
            var vertex = center
            vertex.x += cos(arc * CGFloat(i) - 2 * CGFloat.pi) * radius
            vertex.y += sin(arc * CGFloat(i) - 2 * CGFloat.pi) * radius
            vertexArray.append(vertex)
        }
        return vertexArray
    }
    
    // Set default max / min
    var numberOfSides: Int = 8 {
        didSet {
            if !(3...12).contains(numberOfSides){
                if oldValue <= 3 {
                    numberOfSides = 3
                } else {
                    numberOfSides = 12
                }
            }
        }
    }
    
    
    var name: String = "testname"

}

extension CGRect {
    var center: CGPoint {
        get {
            return CGPoint(x: CGFloat(size.width / 2.0 + origin.x) , y: CGFloat(size.height / 2.0 + origin.y))
        }
    }
}
