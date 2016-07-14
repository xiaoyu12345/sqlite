//
//  ViewController.swift
//  sqlite
//
//  Created by 小鱼🐟 on 16/7/11.
//  Copyright © 2016年 小鱼🐟. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    @IBOutlet weak var txtAddess: UITextField!
    @IBOutlet weak var txtGuanxi: UITextField!
    @IBOutlet weak var txtBeiZhu: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        
    }
    
    //点击保存
    
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
            txtEmail.text=user["email"]as?String
            txtBirthday.text=user["birthday"]as?String
            txtAddess.text=user["addess"]as?String
            txtGuanxi.text=user["guanxi"]as?String
            txtBeiZhu.text=user["beizhu"]as?String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.txtUname.text!
        let mobile = self.txtMobile.text!
        let email = self.txtEmail.text!
        let bierthday = self.txtBirthday.text!
        let addess = self.txtAddess.text!
        let guanxi = self.txtGuanxi.text!
        let beizhu = self.txtBeiZhu.text
        
        
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

