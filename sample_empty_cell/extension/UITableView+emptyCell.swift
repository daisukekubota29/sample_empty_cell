//
//  UITableView+emptyCell.swift
//  sample_empty_cell
//
//  Created by Daisuke Kubota on 2020/03/04.
//  Copyright © 2020 d-kubota.com. All rights reserved.
//

import UIKit

extension UITableView {
    func emptyCell(indexPaht: IndexPath) -> UITableViewCell {
        if let cell = self.dequeueReusableCell(withIdentifier: EmptyCell.identifier) {
            debugPrint("reuse")
            return cell
        }
        return EmptyCell.instance()
    }
}

class EmptyCell: UITableViewCell {

    static let identifier = "EmptyCell"

    override var reuseIdentifier: String? { EmptyCell.identifier }

    static func instance() -> EmptyCell {
        let cell = EmptyCell()
        cell.initialize()
        return cell
    }

    private func initialize() {
        self.contentView.autoresizingMask = .flexibleHeight
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return CGSize(width: targetSize.width, height: 0.01)
    }
}
