//
//  PublicUse.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/24.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit
public func isiPhoneX() ->Bool {
    let screenHeight = UIScreen.main.nativeBounds.size.height;
    if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
        return true
    }
    return false
}
public let   statusbarheight:CGFloat = isiPhoneX() ? 44:20
public let   navbarheight:CGFloat = 44.0
public let   statusnavheight:CGFloat = statusbarheight + navbarheight
public  let  tabbarheight:CGFloat = isiPhoneX() ? 49+34 : 49
public let  navbarandtabbarheight = statusnavheight + tabbarheight
public let  screenwidth:CGFloat = UIScreen.main.bounds.size.width
public  let screenheight:CGFloat = UIScreen.main.bounds.size.height

