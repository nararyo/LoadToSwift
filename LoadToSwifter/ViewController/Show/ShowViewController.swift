//
//  ShowViewController.swift
//  LoadToSwifter
//
//  Created by NR on 2020/09/28.
//  Copyright © 2020 nararyo. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    
    //@IBOutlet weak var selectedText: NSLayoutConstraint!
    
    @IBOutlet weak var selectedText: UILabel!
    
    var text: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "詳細画面"
        selectedText.text = text
        
    }


    

}
