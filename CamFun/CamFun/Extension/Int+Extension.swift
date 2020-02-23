//
//  Int+Extension.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation

extension  Int {
    
    
    static func randomCustom(min: Int, max: Int) -> Int {
        
            var y = arc4random() % UInt32(max) + UInt32(min)
        
            return Int(y)
    }
}
