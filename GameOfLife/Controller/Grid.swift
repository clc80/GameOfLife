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
    
    // Counters
    var generation = 0
    var population = 0
    
    // Creature
    var gridArray = [[Creature]]()
    
    // Called when a touch begins
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Only one touch
        let touch = touches.first!
        let location = touch.location(in: self)
        
        //calculate the grid array position
        let gridX = Int(location.x) / cellWidth
        let gridY = Int(location.y) / cellHeight
        
        // Make the bubble visibility
        let creature = gridArray[gridX][gridY]
        creature.isAlive = !creature.isAlive
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
        
        // set isNotAlive
        creature.isAlive = false
        
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
    
    // Check the neighbors
    func checkNeighbors() {
        // Loop through colums
        for gridX in 0..<columns {
            // Loop through rows
            for gridY in 0..<rows {
                // grab the creature at the position
                let currentCreature = gridArray[gridX][gridY]
                // reset neighbor count
                currentCreature.neighborCount = 0
                // loop through all adjacent creatures
                for innerGridX in (gridX - 1)...(gridX + 1) {
                    //make sure it's inside the array
                    if innerGridX < 0 || innerGridX >= columns { continue }
                    for innerGridY in (gridY - 1)...(gridY + 1) {
                        // make sure it's inside the array
                        if innerGridY < 0 || innerGridY >= rows { continue }
                        // Don't count itself
                        if innerGridX == gridX && innerGridY == gridY { continue }
                        // Grab adjacent creature
                        let adjacentCreature:Creature = gridArray[innerGridX][innerGridY]
                        // onli interested in living creatures
                        if adjacentCreature.isAlive {
                            currentCreature.neighborCount += 1
                        }
                    }
                }
            }
        }
    }
    
    // update the creatrue status
    func updateCreatues() {
        // Reset the population counter
        population = 0
        //loop through columns
        for gridX in 0..<columns {
            //loop through rows
            for gridY in 0..<rows {
                //grab the creature
                let currentCreature = gridArray[gridX][gridY]
                //check to makse sure all rules are followed
                switch currentCreature.neighborCount {
                case 3:
                    currentCreature.isAlive = true
                    break
                case 0...1, 4...8:
                    currentCreature.isAlive = false
                    break
                default:
                    break
                }
                // refresh the population count
                if currentCreature.isAlive { population += 1 }
            }
        }
        
    }
    
    // Update the grid
    func evolve() {
        // update all creature neighbors
        checkNeighbors()
        
        // calculate all creatures
        updateCreatues()
        
        // increment generation counter
        generation += 1
    }
    
}


