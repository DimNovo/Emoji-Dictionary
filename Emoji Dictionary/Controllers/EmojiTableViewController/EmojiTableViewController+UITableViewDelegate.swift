//
//  EmojiTableViewController+UITableViewDelegate.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 21/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

extension EmojiTableViewController/*: UITableViewDelegate*/ {
    // MARK: - ... Method edit cells
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return insertMode ? .insert : .delete
    }
    // MARK: - ... Method switch editing style
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            let emoji = emojis[indexPath.row]
            emojis.insert(emoji, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .top)
        case .delete:
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .none:
            break
        }
    }
    // MARK: - ... Method - mooving cells
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    // MARK: - ... Method - set editing style (.delete or .insert)
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if !editing { insertMode.toggle() }
    }
}
