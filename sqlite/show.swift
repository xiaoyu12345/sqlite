//
//  show.swift
//  sqlite
//
//  Created by 小鱼🐟 on 16/7/13.
//  Copyright © 2016年 小鱼🐟. All rights reserved.
//

import UIKit

class show: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var seek: UITextField!
    @IBOutlet weak var showall: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
    
    }
    
    //点击保存
    @IBAction func a(sender: AnyObject) {
        initUser()
    }
    
  
    
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            var user = data[data.count - 1]
           showall.text = user["uname"] as? String
            showall.text = user["mobile"] as? String
          
        }
    }
    
    //保存数据到SQLite
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
