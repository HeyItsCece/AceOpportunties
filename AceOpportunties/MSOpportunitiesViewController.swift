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
    var msOpportunities_titles: [String] = ["Girls Who Code Campus","STEM matters"]
    var msOpportunities_details: [String] = ["The Girls Who Code campus program is a two week program which introduces girls from ages  10- 18 to computer science. It offers various courses such as: Intro to computer science, Iphone App development 1,Iphone App development 2,and Web Design. It is held in cities like NYC, los Angeles,Seattle,Boston, Bay Area, and more. Aside from this, Girls Who Code offers discounts and need based scholarships!","This program is for students in grades K-11. This program offers different materials in topics from aerospace to animal science, marine biology to mechanics, and ecology to engineering. This also allows for week long programs, highschool internships, and four week long programs that allow for college credit!"]
    
    //////////// FUNCTIONS /////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
        self.msOpportunitiesTableView.estimatedRowHeight = 100
        self.msOpportunitiesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getData() {
        do {
            msOpportunities = try context.fetch(Opportunity.fetchRequest())
            if (msOpportunities.count == 0) {
                for i in 0 ... msOpportunities_titles.count - 1 {
                    var test: Opportunity = Opportunity(context: context)
                    test.title = msOpportunities_titles[i]
                    test.details = msOpportunities_details[i]
                    test.ages = "MS"
                    msOpportunities.append(test)
                }
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
        cell.textLabel?.text = msOpportunities[indexPath.row].title
        cell.detailTextLabel?.text = msOpportunities[indexPath.row].details
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
