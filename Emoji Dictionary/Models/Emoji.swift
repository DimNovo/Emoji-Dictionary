//
//  Emoji.swift
//  Emoji Dictionary
//
//  Created by Dmitry Novosyolov on 21/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static func load() -> [Emoji] {
        return [
        Emoji(symbol: "😀", name: "Смайилик", description: "Улыбающаяся рожица", usage: "Используется, когда смешно"),
        Emoji(symbol: "👮‍♂️", name: "Коп", description: "Полицейский", usage: "Призыв к соблюдению закона"),
        Emoji(symbol: "🌏", name: "Земля", description: "Земной шар", usage: "Информация о глобальном мире"),
        Emoji(symbol: "🚀", name: "Ракета", description: "Летящая ракета", usage: "Указание на быструю скорость")
        ]
    }
}
