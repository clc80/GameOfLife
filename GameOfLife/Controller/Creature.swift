//
//  Creature.swift
//  GameOfLife
//
//  Created by Claudia Maciel on 10/15/20.
//

import SpriteKit

class Creature: SKSpriteNode {
    // Character
    var isAlive: Bool = false {
        didSet {
            // Visibility
            isHidden = !isAlive
        }
    }
    
    // Living Neighbor Counter
    var neighborCount = 0
    
    init() {
        // Initialize with sphere
        let texture = SKTexture(imageNamed: "BubbleOn")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        // Set the z position
        zPosition = 1
        
        // Set anchor point to bottom - left instead of the middle
        anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
