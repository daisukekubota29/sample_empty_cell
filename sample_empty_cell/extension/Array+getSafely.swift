//
//  Array+getSafely.swift
//  sample_empty_cell
//
//  Created by Daisuke Kubota on 2020/03/04.
//  Copyright © 2020 d-kubota.com. All rights reserved.
//

import Foundation

extension Array {
    func getSafely(index: Int) -> Element? {
        if index >= 0 && self.count > index {
            return self[index]
        }
        return nil
    }
}
