//
//  Dictionary+getSafely.swift
//  sample_empty_cell
//
//  Created by Daisuke Kubota on 2020/03/04.
//  Copyright © 2020 d-kubota.com. All rights reserved.
//

import Foundation

extension Dictionary {
    func getSafely(index: Int) -> Value? {
        guard let key = getKey(index: index) else { return nil }
        return self[key]
    }

    func getKey(index: Int) -> Key? {
        return Array(keys).getSafely(index: index)
    }
}
