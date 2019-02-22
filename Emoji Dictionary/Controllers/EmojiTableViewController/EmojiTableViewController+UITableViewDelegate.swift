//
//  EmojiTableViewController+UITableViewDelegate.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 21/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

extension EmojiTableViewController/*: UITableViewDelegate*/ {
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "𝘿𝙀𝙇𝙀𝙏𝙀") {
            (action, indexPath) in
            self.emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let insert = UITableViewRowAction(style: .normal, title: "𝙄𝙉𝙎𝙀𝙍𝙏") {
            (action, indexPath) in
            let emoji = self.emojis[indexPath.row]
            self.emojis.insert(emoji, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .top)
        }
        
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        insert.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        return [delete, insert]
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}
