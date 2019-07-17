//
//  MSOpportunitiesViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/16/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit

class MSOpportunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /////////////// OUTLETS ////////////////
    @IBOutlet weak var msOpportunitiesTableView: UITableView!
    
    ///////// STRUCTS & CLASSES ////////////
    
    ////////////// VARIABLES ///////////////
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var msOpportunities: [Opportunity] = []
    
    //////////// FUNCTIONS /////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        do {
            msOpportunities = try context.fetch(Opportunity.fetchRequest())
            if (msOpportunities.count == 0) {
                let test: Opportunity = Opportunity(context: context)
                test.title = "testing"
                test.details = "details about testing"
                test.ages = "MS"
                msOpportunities.append(test)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
            DispatchQueue.main.async {
                self.msOpportunitiesTableView.reloadData()
            }
            print(msOpportunities[0].title)
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(msOpportunities.count)
        return msOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = msOpportunitiesTableView.dequeueReusableCell(withIdentifier: "msCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(msOpportunities[indexPath.row].title ?? "n/a") \(msOpportunities[indexPath.row].details ?? "n/a")"
        print("\(msOpportunities[indexPath.row].title ?? "n/a") \(msOpportunities[indexPath.row].details ?? "n/a")")
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
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
