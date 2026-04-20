//
//  ViewController.swift
//  calendar
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class ViewController: UIViewController {

    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = .white
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.register(ThirtyDayCell.self, forCellReuseIdentifier: "cellid")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        
        NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! ThirtyDayCell
        cell.dayLabel.text = "Day \(indexPath.row + 1)"
        return cell
    }
    
    
}
