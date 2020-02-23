//
//  MainTabbarViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/21.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import RAMAnimatedTabBarController
class MainTabbarViewController: RAMAnimatedTabBarController ,UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        commitInitView()
        self.addAllChildsControllors();
        super.viewDidLoad()
        self.delegate = self
    }
    func addAllChildsControllors(){
        
        ///首页
        addChildVC(childVC:IndexViewController.sharevc(), title:"首页", imageNormal:UIImage(imageLiteralResourceName:"tabbar_index"), imageSelect: UIImage(named:"tabbar_index_selected"))
        //当前位置
        addChildVC(childVC:LocationViewController.sharevc(), title:"当前位置", imageNormal:UIImage(imageLiteralResourceName:"tabbar_location"), imageSelect: UIImage(named:"tabbar_location_selected"))
        addChildVC(childVC:MakeVideoViewController.sharevc(), title:"", imageNormal:UIImage(imageLiteralResourceName:"tabbar_make"), imageSelect: UIImage(named:"tabbar_make"))
        ///消息
        addChildVC(childVC:MessageViewController.sharevc(), title:"消息", imageNormal:UIImage(imageLiteralResourceName:"tabbar_message"), imageSelect: UIImage(named:"tabbar_message_selected"))
        //我的
        addChildVC(childVC:MineViewController.sharevc(), title:"我", imageNormal:UIImage(imageLiteralResourceName:"tabbar_mine"), imageSelect: UIImage(named:"tabbar_mine_selected"))
        
        
    }
    func addChildVC(childVC: BaseViewController, title: String?, imageNormal: UIImage?, imageSelect:UIImage? ) {
        let navVC = BaseNavgationController(rootViewController: childVC)
        let item = RAMAnimatedTabBarItem(title: title, image: imageNormal, selectedImage: imageSelect)
        
        item.textColor = UIColor.gray
        item.textFontSize = 14
        item.iconColor = UIColor.gray
        //  你这个选择这其中的一个RAMFumeAnimation, RAMBounceAnimation, RAMRotationAnimation, RAMFrameItemAnimation, RAMTransitionAnimation
        // 你也可以为你的每一个item加载不同的动画，可以根据自己需求添加
        let animation = RAMRotationAnimation()
        item.animation = animation
        item.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        animation.textSelectedColor = UIColor.white
        animation.iconSelectedColor = UIColor.white
        //  这里需要先把导航控制器，加入tabbar控制器上，然后添加item，这个顺序错了，也是没有动画效果的。
        addChild(navVC);
        navVC.tabBarItem = item
    }
    
    
}
extension   MainTabbarViewController{
    
    
    func commitInitView() {
        
        
        
        
        
        
        self.tabBar.barTintColor = UIColor.clear
    }
}
