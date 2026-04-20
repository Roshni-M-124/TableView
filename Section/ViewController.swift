//
//  ViewController.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    
    let profileData = ["John"]
    let infoData = ["Phone: 94228 98765","Email: john@gmail.com","Address:  New York, USA"]
    let friendsData = ["Alice","Bob","David"]
    
    enum SectionType: Int,CaseIterable{
        case profile
        case info
        case friends
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")//ProfileCell is type name, ProfileCell.self is type object and ProfileCell() is instance we give the type of class to create instance of this class later .
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
           return SectionType.allCases.count
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else { return 0 }

        switch sectionType {
            case .profile:
                return profileData.count
            case .info:
            return infoData.count
            case .friends:
                return friendsData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sectionType{
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.nameLabel.text = profileData[indexPath.row]
            return cell
            
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
            cell.infoLabel.text = infoData[indexPath.row]
            return cell
            
        case .friends:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
            cell.friendLabel.text = friendsData[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

            guard let sectionType = SectionType(rawValue: section) else { return nil }

            switch sectionType {
            case .profile:
                return "Profile"
            case .info:
                return "Info"
            case .friends:
                return "Friends"
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let sectionType = SectionType(rawValue: indexPath.section) else { return }
        
        switch sectionType {
        case .profile:
            print("Profile tapped")
        case .info:
            let info = infoData[indexPath.row]
            print("Tapped \(info)")
        case .friends:
            let friend = friendsData[indexPath.row]
            print("Tapped \(friend)")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

