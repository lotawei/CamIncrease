//
//  IndexViewController.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/21.
//  Copyright © 2020 伟龙. All rights reserved.
//

import Foundation
import UIKit
import AMScrollingNavbar
import SnapKit
import RxSwift
import RxCocoa
import pop
class IndexViewController: BaseViewController ,ScrollingNavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    static func  sharevc() -> IndexViewController
    {
           let  indexvc =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"IndexViewController") as! IndexViewController
           return indexvc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //tableview bind
        self.tableViewDataInital()
    
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            
            navigationController.followScrollView(self.tableView)
             
               
           }
    }
   
    
}

extension IndexViewController{
    func  layoutScorller(){
        
        
        
    }
    
    
    
}
extension  IndexViewController{
    func  tableViewDataInital(){
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.separatorColor = UIColor.clear
        self.tableView.separatorStyle  = .none
        
      self.tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view)
        }
        self.tableView.rowHeight =  tableView.frame.size.height
            self.tableView.showsVerticalScrollIndicator = false
        

        IndexVedieManager.shareInstance.recommandprevedioes.asObserver().bind(to: tableView.rx.items) { (tableView, row, element) in
                 let cell = tableView.dequeueReusableCell(withIdentifier: "RecommandVedioCell") as! RecommandVedioCell
            cell.vedioinfoConfig(element)

                 return cell
             }.disposed(by: self.disposebag)
        tableView.rx.willDisplayCell.subscribe(onNext: { cell, indexPath in
            let  smallscale = POPBasicAnimation.init(propertyNamed: kPOPLayerPositionX)
            smallscale?.fromValue = NSValue(cgPoint: CGPoint(x:-self.view.center.x, y:0))
            smallscale?.toValue = NSValue(cgPoint: CGPoint(x:self.view.center.x , y:0))
                     
            smallscale?.duration = 0.7

            cell.pop_add(smallscale, forKey:"position.x")

            
         
            
             
        }).disposed(by: self.disposebag)
            
        
    }

    
    
}
