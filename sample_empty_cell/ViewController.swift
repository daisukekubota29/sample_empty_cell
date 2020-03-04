//
//  ViewController.swift
//  sample_empty_cell
//
//  Created by Daisuke Kubota on 2020/03/04.
//  Copyright © 2020 d-kubota.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UserCell.nib(), forCellReuseIdentifier: UserCell.identifier )
            tableView.delegate = self
            tableView.dataSource = self
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        }
    }

    private var users = UserModel.createUserDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func refresh() {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            self.users = UserModel.createUserDictionary()
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return users.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.getSafely(index: section)?.count ?? 0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return users.getKey(index: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell,
            let user = users.getSafely(index: indexPath.section)?.getSafely(index: indexPath.row) else {
                fatalError()
        }
        cell.bind(user: user)
        return cell
    }

}
