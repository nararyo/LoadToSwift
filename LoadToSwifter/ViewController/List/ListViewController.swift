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
    typealias MySectionRows = (section: String, row: Array<Task>)
    var mySectionRows: [MySectionRows] = [("Xcode", []), ("Swift基礎", []), ("ライブラリ", []), ("デザインの実装", []), ("データ通信", []), ("あったら良いスキル", []), ("その他", [])]
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
        todoTable.register(UINib.init(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
}

//MARK: -createButtonを押した時の値の受け渡し
extension ListViewController: CreateTaskViewControllerDelegate {
    
    func addTask(genreIndex: Int, name: String) {
        let task = Task(name: name)
        if let task = task {
            self.mySectionRows[genreIndex].row.insert(task, at: 0)
            todoTable.reloadData()
        }
        todoTable.reloadData()
        print(mySectionRows[genreIndex].row[0].name ?? "nanasi")
    }
}

extension ListViewController: ShowViewControllerDelegate {
    
    func editTask(task: Task, indexPath: IndexPath) {
        print(#function)
        var updateTask = mySectionRows[indexPath.section].row[indexPath.row]
        updateTask = task
        print(updateTask.mention!)
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        let task = mySectionRows[indexPath.section].row[indexPath.row]
        cell.cosmosView.rating = task.achievement ?? 0
        cell.taskLabel?.text = "\(task.name ?? "名無し")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let showVC = ShowViewController()
        //ここをモデルでの受け渡しにする
        showVC.selectedTask = mySectionRows[indexPath.section].row[indexPath.row]
        showVC.didSelectRowAt = indexPath
        showVC.delegate = self
        navigationController?.pushViewController(showVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
