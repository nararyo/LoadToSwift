//
//  ShowViewController.swift
//  LoadToSwifter
//
//  Created by NR on 2020/09/28.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit
import Cosmos

protocol ShowViewControllerDelegate: class {
    func editTask(task: Task, indexPath: IndexPath)
}

class ShowViewController: UIViewController {
    
    @IBOutlet weak var selectedText: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var mentionTextView: UITextView!
    var saveBtn: UIBarButtonItem!
    var selectedTask: Task?
    var didSelectRowAt: IndexPath?
    var delegate: ShowViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        title = "詳細画面"
        print(self.selectedTask?.name ?? "noname")
        selectedText.text = self.selectedTask?.name
        cosmosView.rating = self.selectedTask?.achievement ?? 0
        mentionTextView.text = self.selectedTask?.mention
        saveBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveTaped))
        self.navigationItem.rightBarButtonItem = saveBtn
        
    }
    
    @objc func saveTaped() {
        print(#function)
        selectedTask?.name = selectedText.text
        selectedTask?.achievement = cosmosView.rating
        selectedTask?.mention = mentionTextView.text
        if let task = self.selectedTask {
            delegate?.editTask(task: task, indexPath: didSelectRowAt!)
        }
        navigationController?.popViewController(animated: true)
        
    }


    

}
