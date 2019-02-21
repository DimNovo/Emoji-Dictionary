//
//  EmojiTableViewController.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 21/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis = [Emoji]()
    var insertMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = Emoji.load()
        startUI()
        
    }
    
    func startUI() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
}
