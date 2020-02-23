//
//  MineViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/22.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit
import AMScrollingNavbar
import pop
import SnapKit
import RxCocoa




class MineViewController:BaseViewController,ScrollingNavigationControllerDelegate{
    let  topcellheight:CGFloat = 400.0
    let  gradecellheight:CGFloat = 200.0
    let  messagecellheight:CGFloat = 200.0
    static func  sharevc() -> MineViewController
    {
        let  instancevc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:String.init(describing: self.classForCoder())) as! MineViewController
        return instancevc
    }
    @IBOutlet  weak  var  tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //自定义导航栏
        navInital()
        //table init
        tableViewDataInital()
    }
    
    func navInital(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "bar_back_nav"), for: .default)
        
        let  righticonsetting = UIBarButtonItem.init(image:UIImage.init(named: "bar_setting"), style: .plain, target: self, action: #selector(settingVc))
        let  righticonmesg = UIBarButtonItem.init(image:UIImage.init(named: "bar_message"), style: .plain, target: self, action: #selector(mesgenter))
        self.navigationItem.rightBarButtonItems = [ righticonsetting, righticonmesg]
        
    }
    @objc func  settingVc(){
        
        
    }
    @objc func  mesgenter(){
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            
            navigationController.followScrollView(self.tableView)
            
            
        }
    }
    
    
    
    
}

extension    MineViewController:UITableViewDelegate,UITableViewDataSource{
    
    func  tableViewDataInital(){
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle  = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view)
        }
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return   3;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let   topcell = tableView.dequeueReusableCell(withIdentifier: "MineInfoTopCell") as! MineInfoTopCell
            
            return  topcell
            
            
        }
        else if indexPath.section == 1 {
            let   gradecell = tableView.dequeueReusableCell(withIdentifier: "MineGradeCell") as! MineGradeCell
            
            return  gradecell
            
            
        }
        else {
            
            let   messagecell = tableView.dequeueReusableCell(withIdentifier: "MineMessageCell") as! MineMessageCell
            
            return  messagecell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            
            return  topcellheight
            
            
        }
        else if indexPath.section == 1 {
            
            
            return  gradecellheight
            
            
        }
        else {
            
            
            
            return  messagecellheight
        }
    }
    
    
    
}
