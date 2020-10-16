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
    
    // Creature
    var gridArray = [[Creature]]()
    
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
        
        //Populate grid
        populateGrid()
    }


    // Add a new creature at grid position
    func addCreatureAtPosition(x: Int, y: Int) {
        // New creature object
        let creature = Creature()
        
        //Calculate position on screen
        let gridPosition = CGPoint(x: x*cellWidth, y: y*cellWidth)
        creature.position = gridPosition
        
        // set isAlive
        creature.isAlive = true
        
        //Add to the grid
        addChild(creature)
        
        // Add to the array
        gridArray[x].append(creature)
    }
    
    // Populate the grid with more creatures
    func populateGrid() {
        // Loop through the columns
        for gridX in 0..<columns {
            //Initialize empty column
            gridArray.append([])
            //Loop through rows
            for gridY in 0..<rows {
                //Create a new creature at row/column
                addCreatureAtPosition(x: gridX, y: gridY)
            }
            
        }
    }
    
    
}


