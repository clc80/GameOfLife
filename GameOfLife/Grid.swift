//
//  Grid.swift
//  GameOfLife
//
//  Created by Claudia Maciel on 10/13/20.
//

import SpriteKit

class Grid:SKSpriteNode {
    // Grid Array Dimensions
    let rows = 28
    let columns = 28
    
    // Cell Dimensions, to be calculated during startup
    var cellWidth = 0
    var cellHeight = 0
    
    // Called when a touch begins
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Only one touch
        let touch = touches.first!
        let location = touch.location(in: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Enable own touch implementation on this node
        isUserInteractionEnabled = true
        
        // Calculate individual cell dimensions
        cellWidth = Int(size.width) / columns
        cellHeight = Int(size.height) / rows
    }
}
