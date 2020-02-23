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
    var  barishidden:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.barishidden = self.navigationController?.navigationBar.isHidden ?? false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = self.barishidden
    }
    deinit {
        print("已释放")
    }
}

