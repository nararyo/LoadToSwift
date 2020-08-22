//
//  ListViewController.swift
//  LoadToSwifter
//
//  Created by 奈良亮 on 2020/08/22.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    let sectionArray = ["Xcode", "Swift基礎", "ライブラリ", "デザインの実装", "データ通信", "あったら良いスキル", "その他"]
    var rowArray = ["a", "b"]
    
    @IBOutlet weak var todoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
       
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
}

//MARK: -delegateのセットアップ
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(rowArray[indexPath.row])"
        
        return cell
    }
    
}
