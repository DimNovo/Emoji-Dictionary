//
//  EmojiStorage.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 22/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class EmojiStorage {
    
    static var shared = EmojiStorage()
    
    let documentDirectory =
        FileManager.default.urls(for:
            .documentDirectory, in:
            .userDomainMask).first!
    
    let archiveURL: URL
    
    private init() {
        archiveURL =
            documentDirectory
                .appendingPathComponent("emojis")
                .appendingPathExtension("plist")
        
        print(#function, archiveURL)
    }
    
    func load() -> [Emoji]? {
        guard let data = try? Data(contentsOf: archiveURL) else { return nil }

        let decoder = PropertyListDecoder()
        let decodedEmojis = try? decoder.decode([Emoji].self, from: data)

        return decodedEmojis
    }
    
    func save(emojis: [Emoji]) {
        
        let encoder = PropertyListEncoder()
        let encodedEmojis = try? encoder.encode(emojis)
        
        do {
            try encodedEmojis?.write(to: archiveURL, options: .noFileProtection)
        } catch {
            print(#function, error.localizedDescription)
        }
    }
}
