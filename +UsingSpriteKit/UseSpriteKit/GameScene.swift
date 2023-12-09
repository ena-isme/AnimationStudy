//
//  GameScene.swift
//  UseSpriteKit
//
//  Created by 신지원 on 12/2/23.
//

import SpriteKit
import GameplayKit

class SnowScene: SKScene {
    
    override func didMove(to view: SKView) {
        setScene(view)
        setSnowNode()
    }
    
    override func didApplyConstraints() {
        guard let view = view else { return }
        scene?.size = view.frame.size
    }
    
    private func setScene(_ view: SKView) {
        backgroundColor = .clear
        scene?.anchorPoint = CGPoint(x: 0.5, y: 1)
        scene?.scaleMode = .aspectFill
    }
    
    private func setSnowNode() {
        guard let snowNode = SKEmitterNode(fileNamed: "MyParticle") else { return }
        snowNode.position = .zero
        scene?.addChild(snowNode)
    }
}
