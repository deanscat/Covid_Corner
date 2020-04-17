//
//  GameScene.swift
//  Covid_corner_3
//
//  Created by Dean Scattini on 4/16/20.
//  Copyright © 2020 Dean Scattini. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gameLogo : SKLabelNode!
    var playButton : SKShapeNode!
    var settingsButton : SKLabelNode!
    var scoreBoard : SKLabelNode!
    var currentPosition : [(Int, Int)] = []
    var gameBG : SKShapeNode!
    var gameArray : [(node: SKShapeNode, x: Int, y: Int)] = []
    
    var game : GameManager!
    
    override func didMove(to view: SKView) {
        
        initializeMenu()
        game = GameManager()
        initializeGameView()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at:location)
            for node in touchedNode {
                
                if node.name == "play_button" {
                    
                    startGame()
                }
                if node.name == "settings_button" {
                    
                    settings()
                }
            }
        }
    }
    
    private func startGame() {
        print("start game")
        gameLogo.run(SKAction.move(by: CGVector(dx: -50, dy: 600), duration: 0.5)) {
        self.gameLogo.isHidden = true
        }
        //2
        playButton.run(SKAction.scale(to: 0, duration: 0.3)) {
            self.playButton.isHidden = true
        }
        //self.scoreBoard.setScale(0)
        self.gameBG.isHidden = false
        self.scoreBoard.isHidden = false
        //self.gameBG.run(SKAction.scale(to: 1, duration: 0.4))
        //self.scoreBoard.run(SKAction.scale(to: 1, duration: 0.4))
        //3
       
    }
    
    private func settings() {
        
        print("settings")
    }
    private func initializeMenu() {
        //Create game title
        gameLogo = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        gameLogo.zPosition = 1
        gameLogo.position = CGPoint(x: 0, y: (frame.size.height / 2) - 500)
        gameLogo.fontSize = 110
        gameLogo.text = "Covid Corner"
        gameLogo.fontColor = SKColor.green
        self.addChild(gameLogo)
        //Create settings button
        
        settingsButton = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        settingsButton.name = "settings_button"
        settingsButton.zPosition = 1
        settingsButton.position = CGPoint(x: (frame.size.width / 2) - 105, y: (frame.size.height / 2) - 50)
        settingsButton.fontSize = 50
        settingsButton.fontColor = SKColor.gray
        settingsButton.text = "Settings"
        self.addChild(settingsButton)
        
        //create play button
        playButton = SKShapeNode()
        playButton.name = "play_button"
        playButton.zPosition = 1
        playButton.position = CGPoint(x: 0, y: (frame.size.height / -2) + 200)
        playButton.fillColor = SKColor.cyan
        let topCorner = CGPoint(x: -50, y: 50)
        let bottomCorner = CGPoint(x: -50, y: -50)
        let middle = CGPoint(x: 50, y: 0)
        let path = CGMutablePath()
        path.addLine(to: topCorner)
        path.addLines(between: [topCorner, bottomCorner, middle])
        playButton.path = path
        self.addChild(playButton)
    }
    private func initializeGameView() {
        
        print("okie")
        scoreBoard = SKLabelNode(fontNamed: "ArialRoundedMTBold")
        scoreBoard.zPosition = 1
        scoreBoard.position = CGPoint(x: 0, y: (frame.size.height / -2) + 60)
        scoreBoard.fontSize = 40
        scoreBoard.isHidden = true
        scoreBoard.text = "Score: 0"
        scoreBoard.fontColor = SKColor.white
        self.addChild(scoreBoard)
        let width = 750
        let height = 1100
        let rect = CGRect(x: -width / 2, y: -height / 2, width: width, height: height)
        gameBG = SKShapeNode(rect: rect, cornerRadius: 0.02)
        gameBG.fillColor = SKColor.darkGray
        gameBG.zPosition = 2
        gameBG.isHidden = true
        self.addChild(gameBG)
    }
}

