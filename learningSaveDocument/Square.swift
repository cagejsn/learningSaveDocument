//
//  File.swift
//  learningSaveDocument
//
//  Created by Cage Johnson on 2/3/17.
//  Copyright © 2017 desk. All rights reserved.
//

import Foundation
import UIKit

class Square: UIView {
    
    
    
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let loc = touch?.location(in: self)
        let prevLoc = touch?.previousLocation(in: self)
        
        let dx = (loc?.x)! - (prevLoc?.x)!
        let dy = (loc?.y)! - (prevLoc?.y)!
        
        self.frame = self.frame.offsetBy(dx: dx, dy: dy)

    }
    
    
}
