//
//  Emoji.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 21/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//
import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    var encoded: Data? {
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(self)
        
        return data
    }
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    init?(data: Data?) {
        guard let data = data else { return nil }
        let decoder = PropertyListDecoder()
        guard let emoji = try? decoder.decode(Emoji.self, from: data) else { return nil }
        
        self.init(symbol: emoji.symbol,
                  name: emoji.name,
                  description: emoji.description,
                  usage: emoji.usage)
    }
    
    static func loadDefaultValues() -> [Emoji] {
        return [
        Emoji(symbol: "😀", name: "Смайлик", description: "Улыбающаяся рожица", usage: "Используется, когда смешно"),
        Emoji(symbol: "👮‍♂️", name: "Коп", description: "Полицейский", usage: "Призыв к соблюдению закона"),
        Emoji(symbol: "🌏", name: "Земля", description: "Земной шар", usage: "Информация о глобальном мире"),
        Emoji(symbol: "🚀", name: "Ракета", description: "Летящая ракета", usage: "Указание на быструю скорость")
        ]
    }
}
