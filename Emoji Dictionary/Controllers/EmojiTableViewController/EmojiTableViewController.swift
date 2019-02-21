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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "EmojiEditSegue" else { return }
        guard let controller = segue.destination as? EmojiDetailTableViewController else { return }
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        
        let emoji = emojis[selectedPath.row]
        controller.emoji = emoji
        controller.navigationItem.title = "Edit"
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
        guard segue.identifier == "EmojiSaveSegue" else { return }
        guard let controller = segue.source as? EmojiDetailTableViewController else { return }
        guard let emoji = controller.emoji else { return }
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            // Edited row
            emojis[selectedPath.row] = emoji
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
           // Added row
            let indexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
