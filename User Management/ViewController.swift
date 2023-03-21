//
//  ViewController.swift
//  User Management
//
//  Created by Kailash Chivhe on 17/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users: [User] = DataInfo.users
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cellNib = UINib(nibName: "UserTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "userCell")
        
    }

    @IBAction func showFilter(_ sender: Any) {
        var actions: [(String, UIAlertAction.Style)] = []
        actions.append(("Gender : Female", UIAlertAction.Style.default))
        actions.append(("Gender : Male", UIAlertAction.Style.default))
        actions.append(("Show All", UIAlertAction.Style.default))
        actions.append(("Cancel", UIAlertAction.Style.default))
            
        Alerts.showActionsheet(viewController: self, title: "Filter By", message: "Pick option to filter users by", actions: actions) { (index) in
            if index == 0{
                self.users = DataInfo.users
                self.users = self.users.filter({ $0.gender == "Female" })
                self.tableView.reloadData()
            }
            else if index == 1{
                self.users = DataInfo.users
                self.users = self.users.filter({ $0.gender == "Male" })
                self.tableView.reloadData()
            }
            else if index == 2{
                self.users = DataInfo.users
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    @IBAction func showSort(_ sender: Any) {
        var actions: [(String, UIAlertAction.Style)] = []
        actions.append(("Name", UIAlertAction.Style.default))
        actions.append(("Age", UIAlertAction.Style.default))
        actions.append(("State", UIAlertAction.Style.default))
        actions.append(("Cancel", UIAlertAction.Style.default))
            
        Alerts.showActionsheet(viewController: self, title: "Sort By", message: "Pick option to sort users by", actions: actions) { (index) in
            if index == 0{
                self.users.sort{
                    $0.name! < $1.name!
                }
                self.tableView.reloadData()
            }
            else if index == 1{
                self.users.sort{
                    $0.age! < $1.age!
                }
                self.tableView.reloadData()
            }
            else if index == 2{
                self.users.sort{
                    $0.state! < $1.state!
                }
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataInfo.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        cell.profileImage.image = UIImage(named: "avatar_male@1x")
        if users[indexPath.row].gender == "Female"{
            cell.profileImage.image = UIImage(named: "avatar_female@1x")
        }
        cell.nameLabel.text = users[indexPath.row].name
        cell.stateLabel.text = users[indexPath.row].state
        cell.ageLabel.text = "\(users[indexPath.row].age!) Years Old"
        cell.typeLabel.text = users[indexPath.row].group
        
        return cell
    }
}

class Alerts {
    static func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
    let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    for (index, (title, style)) in actions.enumerated() {
        let alertAction = UIAlertAction(title: title, style: style) { (_) in
            completion(index)
        }
        alertViewController.addAction(alertAction)
     }
        
     alertViewController.popoverPresentationController?.sourceView = viewController.view
     
     viewController.present(alertViewController, animated: true, completion: nil)
    }
}

