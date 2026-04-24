//
//  ViewController.swift
//  profile_section
//
//  Created by Mobicip on 20/04/26.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    // Frame doesnt matter in autolayout. 2 other style : .grouped space between each section, .insetGrouped rounded edges for content view.
    
    let profileData = [
    """
    John Christopher Anderson The Third,
    Senior Developer with 10+ years of experience in building applications.
    """
    ]

    let infoData: [(key: String, value: String)] = [
        ("Phone", "+91 94228 98765 (Available between 9 AM - 6 PM IST for work-related queries and collaborations)"),
        ("Email", "john.longemailaddress@exampledomain.com (Feel free to reach out for freelance or full-time opportunities)"),
        ("Address", "221B Baker Street, Near Central Park Extension Area, New York City, United States of America")
    ]
    let friendsData = [
    """
    Alice Johnson - UI/UX Designer who loves creating intuitive user experiences and has worked on multiple award-winning apps.
    """,
    """
    Bob Smith - Backend Engineer specializing in distributed systems, APIs, and cloud infrastructure with 8 years of experience.
    """,
    """
    David Lee - Product Manager passionate about building impactful products and leading cross-functional teams.
    """
    ]
    
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
        tableView.estimatedRowHeight = 50
        
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
            let item = infoData[indexPath.row]
            cell.titleLabel.text = item.key
            cell.infoLabel.text = item.value
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

