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
    var gridNode: Grid!
    
    
    override func didMove(to view: SKView) {
        // connect UI objects
        stepForwardButton = childNode(withName: "stepOverButton") as! ButtonNode
        populationLabel = childNode(withName: "populationLabel") as! SKLabelNode
        generationLabel = childNode(withName: "generationLabel") as! SKLabelNode
        playButton = childNode(withName: "playButton") as! ButtonNode
        pauseButton = childNode(withName: "pauseButton") as! ButtonNode
        clearButton = childNode(withName: "clearButton") as! ButtonNode
        stopButton = childNode(withName: "stopButton") as! ButtonNode
        gridNode = childNode(withName: "gridNode") as! Grid
        
        //test step forward button
        stepForwardButton.selectedHandler = {
            self.stepSimulation()
        }
        
        // Create an timer
        let delay = SKAction.wait(forDuration: 0.5)
        // play animation
        let callMethod = SKAction.perform(#selector(stepSimulation), onTarget: self)
        // crate the delay
        let stepSequence = SKAction.sequence([delay, callMethod])
        // infinite loop
        let simulation = SKAction.repeatForever(stepSequence)
        // run action
        self.run(simulation)
        // allow pause
        self.isPaused = true
        // set up play/pause buttons
        playButton.selectedHandler = {[unowned self] in
            self.isPaused = false
        }
        pauseButton.selectedHandler = {[unowned self] in
            self.isPaused = true
        }
        // set up the clear button
        clearButton.selectedHandler = {[unowned self] in
            gridNode.clear()
            // update UIlabel objects
            populationLabel.text = String(gridNode.population)
            generationLabel.text = String(gridNode.generation)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    // step by step
    @objc func stepSimulation() {
        // run next step in simulation
        gridNode.evolve()
        
        // update UIlabel objects
        populationLabel.text = String(gridNode.population)
        generationLabel.text = String(gridNode.generation)
    }
}
