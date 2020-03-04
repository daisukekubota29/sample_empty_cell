//
//  UserModel.swift
//  sample_empty_cell
//
//  Created by Daisuke Kubota on 2020/03/04.
//  Copyright © 2020 d-kubota.com. All rights reserved.
//

import UIKit
import CommonCrypto

private let lastnames = [
    "山田",
    "佐藤",
    "鈴木",
    "田中"
]

private let iconColors = [
    UIColor.red,
    UIColor.green,
    UIColor.blue,
    UIColor.black,
    UIColor.brown,
    UIColor.cyan,
    UIColor.darkGray,
    UIColor.gray,
    UIColor.lightGray,
    UIColor.magenta,
    UIColor.orange,
    UIColor.purple,
]

class UserModel {
    let color: UIColor
    let name: String

    init(name: String) {
        self.name = name
        color = iconColors[name.md5TotalInt % iconColors.count]
    }

    static func createUserDictionary(minCount: Int = 1, maxCount: Int = 10) -> [String: [UserModel]] {
        lastnames.map { lastname in
            (lastname, (1...Int.random(in: minCount ..< maxCount)).map { "\(lastname) \($0)太郎" })
        }
        .reduce([String: [UserModel]]()) { (result, value) in
            var newResult = result
            newResult[value.0] = value.1.map { UserModel(name: $0) }
            return newResult
        }
    }
}

extension String {
    var md5: [CUnsignedChar] {
        var result: [CUnsignedChar]
        let digestLenght = Int(CC_MD5_DIGEST_LENGTH)
        if let cdata = self.cString(using: .utf8) {
            result = Array(repeating: 0, count: digestLenght)
            CC_MD5(cdata, CC_LONG(cdata.count - 1), &result)
        } else {
            fatalError()
        }
        return result
    }

    var md5TotalInt: Int { md5.reduce(0) { Int($0) + Int($1) } }
}
