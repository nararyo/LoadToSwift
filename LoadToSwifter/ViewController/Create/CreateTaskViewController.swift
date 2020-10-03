//
//  CreateTaskViewController.swift
//  LoadToSwifter
//
//  Created by 奈良亮 on 2020/08/23.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

protocol  CreateTaskViewControllerDelegate: class {
    func addTask(genreIndex: Int, name: String)
}

class CreateTaskViewController: UIViewController {
    
    var pickerView: UIPickerView = UIPickerView()
    let list: [String] = ["Xcode", "Swift基礎", "ライブラリ", "デザインの実装", "データ通信", "あったら良いスキル", "その他"]
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    weak var delegate: CreateTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNameTextField()
        setUpPickerView()
    }
    
    // 決定ボタン押下
    @objc func done() {
        genreTextField.endEditing(true)
        genreTextField.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
    }
    
    @IBAction func createButton(_ sender: Any) {
        print(#function)
        let number = genreIndex(genreTextField.text ?? "その他")
        delegate?.addTask(genreIndex: number, name: nameTextField.text ?? "名前なし")
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - メソッド
private extension CreateTaskViewController {
    
//    func outsideTapped() {
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(CreateTaskViewController.tapHandle))
//        view.addGestureRecognizer(gesture)
//    }
//    
//    @objc func tapHandle() {
//        print(#function)
//        view.endEditing(true)
//    }

//MARK: TextField のセットアップ
    func setUpNameTextField(){
        print(#function)
        nameTextField.delegate = self
    }

//MARK:  PickerViewのセットアップ
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

//MARK:  PickerViewの値を数値に変換
    //mySectionRows[sectionNumber]として使用する
    func genreIndex(_ genreText: String) -> Int {
        let sectionNumber : Int
        switch genreText {
        case list[0]:
            sectionNumber = 0
        case list[1]:
            sectionNumber = 1
        case list[2]:
            sectionNumber = 2
        case list[3]:
            sectionNumber = 3
        case list[4]:
            sectionNumber = 4
        case list[5]:
            sectionNumber = 5
        case list[6]:
            sectionNumber = 6
        default:
            sectionNumber = 7
        }
        return sectionNumber
    }
}

//MARK: - PickerViewの設定
//MARK:  PickerViewDelegate
extension CreateTaskViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        list[row]
    }
}

 //MARK:  PickerViewDatasource
extension CreateTaskViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}


//MARK: -TextFieldDelegateの設定
extension CreateTaskViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}


