//
//  ListViewController.swift
//  LoadToSwifter
//
//  Created by 奈良亮 on 2020/08/22.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    //型エイリアスでタプル型のMySectionRowを定義
    typealias MySectionRows = (section: String, row: Array<String>)
    
    var mySectionRows = [MySectionRows]()
    var addBtn: UIBarButtonItem!
    
    @IBOutlet weak var todoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
        mySectionRows.append(("Xcode", ["1", "2"]))
        mySectionRows.append(("Swift基礎", ["3", "4"]))
        mySectionRows.append(("ライブラリ", ["5", "6"]))
        mySectionRows.append(("デザインの実装", ["7", "8"]))
        mySectionRows.append(("データ通信", ["9", "10"]))
        mySectionRows.append(("あったら良いスキル", ["11", "12"]))
        mySectionRows.append(("その他", ["13", "14"]))
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onClick))
        self.navigationItem.rightBarButtonItem = addBtn
       
    }
    
   
    @objc func onClick(){
        
        let createTaskVC = CreateTaskViewController()
        present(createTaskVC, animated: true, completion: nil)
//        let alertController = UIAlertController(title: "課題名", message: "必要なスキルを追加", preferredStyle: UIAlertController.Style.alert)
//        alertController.addTextField(configurationHandler: nil)
//        alertController.addTextField(configurationHandler: nil)
//        present(alertController, animated: true, completion: nil)
//        //alertController.addTextField(configurationHandler: nil)
        
        
//        let okButton = UIAlertAction(title: "追加",
//                                     style: UIAlertAction.Style.default,
//                                     //追加ボタンが押された時の処理
//                                     handler: {(action: UIAlertAction) in
//                                        if let textField = alertController.textFields?.first {
//
//                                        }
  //      })
    }
}

// MARK: -tableviewのセットアップ
private extension ListViewController {
    
    func setTableView() {
        todoTable.delegate = self
        todoTable.dataSource = self
        todoTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

//MARK: -datasourceのセットアップ
extension ListViewController: UITableViewDataSource{
    
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySectionRows.count
    }
    
    //セクションのタイトルの表示
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySectionRows[section].section
    }
    
    //セクション内の行数の数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySectionRows[section].row.count
    }
}

//MARK: -delegateのセットアップ
extension ListViewController: UITableViewDelegate {
    
    //セルの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(mySectionRows[indexPath.section].row[indexPath.row])"
        return cell
    }
    
}
