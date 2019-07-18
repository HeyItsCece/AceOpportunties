//
//  ListViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/17/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //////////// OUTLETS ////////////
    @IBOutlet weak var listTableView: UITableView!
    
    /////////// VARIABLES ///////////
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var listOpportunities: [Opportunity] = []
    
    /////////// FUNCTIONS ///////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
        self.listTableView.estimatedRowHeight = 100
        self.listTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "list == %@", NSNumber(booleanLiteral: true))
        do {
            listOpportunities = try context.fetch(request) as! [Opportunity]
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(listOpportunities.count)
        return listOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = listOpportunities[indexPath.row].title
        cell.detailTextLabel?.text = listOpportunities[indexPath.row].details
        cell.accessoryType = .detailDisclosureButton
        print("\(listOpportunities[indexPath.row].title ?? "n/a") \(listOpportunities[indexPath.row].details ?? "n/a")")
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        var url = URL(string:listOpportunities[indexPath.row].link!)
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!, options: [:],completionHandler: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.listOpportunities[indexPath.row].list = false
            self.listOpportunities.remove(at: indexPath.row)
            self.listTableView.deleteRows(at: [indexPath], with: .fade)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            success(true)
        })
        modifyAction.title = "Delete"
        modifyAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
