//
//  GameScene.swift
//  GameOfLife
//
//  Created by Claudia Maciel on 10/13/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Objects
    var stepForwardButton: ButtonNode!
    var populationLabel: SKLabelNode!
    var generationLabel: SKLabelNode!
    var playButton: ButtonNode!
    var pauseButton: ButtonNode!
    var clearButton: ButtonNode!
    var stopButton: ButtonNode!
    
    
    override func didMove(to view: SKView) {
        // connect UI objects
        stepForwardButton = childNode(withName: "stepOverButton") as! ButtonNode
        populationLabel = childNode(withName: "populationLabel") as! SKLabelNode
        generationLabel = childNode(withName: "generationLabel") as! SKLabelNode
        playButton = childNode(withName: "playButton") as! ButtonNode
        pauseButton = childNode(withName: "pauseButton") as! ButtonNode
        clearButton = childNode(withName: "clearButton") as! ButtonNode
        stopButton = childNode(withName: "stopButton") as! ButtonNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
}
