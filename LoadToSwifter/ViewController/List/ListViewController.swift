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
    
    var mySectionRows: [MySectionRows] = [("Xcode", ["1", "2"]), ("Swift基礎", ["3", "4"]), ("ライブラリ", ["5", "6"]), ("デザインの実装", ["7", "8"]), ("データ通信", ["9", "10"]), ("あったら良いスキル", ["11", "12"]), ("その他", ["13", "14"])]
    
    var addBtn: UIBarButtonItem!
    
    @IBOutlet weak var todoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onClick))
        self.navigationItem.rightBarButtonItem = addBtn
    }
   
    @objc func onClick(){
        
        let createTaskVC = CreateTaskViewController()
        createTaskVC.delegate = self
        present(createTaskVC, animated: true, completion: nil)
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

//MARK: -createButtonを押した時の値の受け渡し
extension ListViewController: CreateTaskViewControllerDelegate {
    
    func addTask(genreIndex: Int, name: String) {
        self.mySectionRows[genreIndex].row.insert(name, at: 0)
        todoTable.reloadData()
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
