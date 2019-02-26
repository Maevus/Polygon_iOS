//
//  ViewController.swift
//  HelloPoly2
//
//  Created by Maeve Lynskey on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vertexCountLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var polygonView: PolygonView!
    
    lazy var polygonModel: PolygonShape = getPolygonModel()
       
    func getPolygonModel() -> PolygonShape {
        let polygon = PolygonShape()
        polygon.numberOfSides = 8
        return polygon
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {

        if sender.direction == .left {
            print ("swipe left")
            decreaseSides()
        } else if sender.direction == .right {
            print ("swipe right")
            increaseSides()
        }
    }

    
    @IBAction func increaseSides() { // shoudl have sender: UIButton?
        polygonModel.numberOfSides += 1
        updateUI()
    }
    
    @IBAction func decreaseSides() {
        polygonModel.numberOfSides -= 1
        updateUI()
    }
    
    func updateUI() {
        // Add persistence
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(polygonModel.numberOfSides, forKey: "numberOfSides")

        // Draw UI
        polygonView.setNeedsDisplay()
        vertexCountLabel.text = String(polygonModel.numberOfSides)
        increaseButton.isEnabled  = polygonModel.numberOfSides == 12 ? false: true
        decreaseButton.isEnabled = polygonModel.numberOfSides == 3 ? false: true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assign polygon model to view delegate
        polygonView.delegate = polygonModel
        
        // Load defaults
        let defaults: UserDefaults = UserDefaults.standard
        if let numberOfSides = defaults.object(forKey: "numberOfSides") as? Int {
            polygonModel.numberOfSides = numberOfSides
        }
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }
}
