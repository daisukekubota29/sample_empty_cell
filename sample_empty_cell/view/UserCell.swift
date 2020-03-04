//
//  UserCell.swift
//  sample_empty_cell
//
//  Created by Daisuke Kubota on 2020/03/04.
//  Copyright © 2020 d-kubota.com. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var iconView: UIView! {
        didSet {
            iconView.layer.cornerRadius = iconView.bounds.size.width / 2
            iconView.clipsToBounds = true
        }
    }

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UserCell {
    func bind(user: UserModel) {
        titleLabel.text = user.name
        iconView.backgroundColor = user.color
    }
}

extension UserCell {
    static func nib() -> UINib { UINib(nibName: "UserCell", bundle: nil) }

    static var identifier: String = "UserCell"
}
