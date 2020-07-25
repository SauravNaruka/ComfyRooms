//
//  FocusARView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/25/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import RealityKit
import FocusEntity
import Combine
import ARKit
import UIKit

class FocusARView: ARView {
    var focusEntity: FocusEntity?
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        self.setupConfig()
        self.focusEntity = FocusEntity(on: self, style: .classic)
    }
    
    func setupConfig() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        
        session.run(config, options: [])
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FocusARView: FocusEntityDelegate {
    func toTrackingState() {
        print("tracking")
    }
    func toInitializingState() {
        print("initializing")
    }
}

