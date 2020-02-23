//
//  ViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/21.
//  Copyright © 2020 伟龙. All rights reserved.
//

import UIKit
import RxSwift
class BaseViewController: UIViewController {
    var  disposebag:DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }

    deinit {
        print("已释放")
    }
}

