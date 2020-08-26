//
//  CreateTaskViewController.swift
//  LoadToSwifter
//
//  Created by 奈良亮 on 2020/08/23.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    var pickerView: UIPickerView = UIPickerView()
    let list: [String] = ["Xcode", "Swift基礎", "ライブラリ", "デザインの実装", "データ通信", "あったら良いスキル", "その他"]
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var genreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickerView()
    }
    
    // 決定ボタン押下
    @objc func done() {
        genreTextField.endEditing(true)
        genreTextField.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
    }
    
    @IBAction func createButton(_ sender: Any) {
        //インスタンス化
        let listVC = ListViewController.init(nibName: "ListViewController", bundle: nil)
        let number = sectionNumbering()
        
        //mySectionRows配列の中から、Pickerviewで指定されたsectionに対応する要素を指定し、row配列の中に格納したい
        if let text = nameTextField.text {
        listVC.mySectionRows[number].row.insert(text, at: 0)
            print(listVC.mySectionRows[number])
        }
        //todoTableにデータが入ったことを知らせたい
        if let table = listVC.todoTable {
            table.insertRows(at: [IndexPath(row: 0, section: number )], with: UITableView.RowAnimation.none)
        }else {
            print("tableがありません")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

//MARK: - メソッド
private extension CreateTaskViewController {
    
//MARK: - PickerViewのセットアップ
    func setUpPickerView(){
        // ピッカー設定
        pickerView.delegate = self
        pickerView.dataSource = self
        //pickerView.showsSelectionIndicator = true
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定
        genreTextField.inputView = pickerView
        genreTextField.inputAccessoryView = toolbar
    }

//MARK: - PickerViewの値を数値に変換
    //mySectionRows[sectionNumber]として使用する
    func sectionNumbering() -> Int {
        let sectionString = genreTextField.text
        let sectionNumber : Int
        if sectionString == "Xcode" {
             sectionNumber = 0
        }else if sectionString == "Swift基礎"{
            sectionNumber = 1
        }else if sectionString == "デザインの実装" {
            sectionNumber = 2
        }else {
            sectionNumber = 6
        }
        return sectionNumber
    }
    
}

//MARK: - PickerViewDelegate
extension CreateTaskViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        list[row]
    }
    
//MARK: - PickerViewDatasource
}
    
extension CreateTaskViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
    
    

