//
//  CollegeOpportunitiesViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/17/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit
import CoreData

class CollegeOpportunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    ///////////// OUTLETS ///////////////
    @IBOutlet weak var collegeOpportunitiesTableView: UITableView!
    
    //////////// VARIABLES //////////////
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var collegeOpportunities: [Opportunity] = []
    var collegeOpportunities_titles: [String] = ["On-Campus Internship","NYU Langone Health","NewYork Institute of Technology Lab Technician"]
    var collegeOpportunities_details: [String] = ["This is a two-semester, paid leadership internship for students of any major who would like to develop essential skills in management, budgeting, communication, public speaking, marketing, and event planning. An intern is to source and manage a team of student leaders to plan a series of life-changing events on campus. This allows students to gain real-life experience, go on an all-expenses paid retreat, it provides them with flexible hours around class schedules, and provides students with stipends.","The basic qualification for this role is to have a highschool diploma. This internship exposes students to real world experiences in the medical field; these candidates are responsible for processing, entering, and storing data from standardized questionnaires for the NYU Women's Health Study. They will also assist Research Coordinators with medical record requests to hospitals,review completeness/accuracy of follow-up questionnaires, Conduct phone calls to study participants, and more.","This is a full time job for college students pursuing Biology. NYIT‘s Department of Life Sciences, seeks a Lab Technician for the Long Island (Old Westbury campus). This job will require you to be knowledgeable of basic lab procedures/safety regulations; you must be able to prepare labs for general science classes, properly store lab equipment/specimens and chemicals, and maintain lab stations clean."]
    
    //////////// FUNCTIONS /////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
        self.collegeOpportunitiesTableView.estimatedRowHeight = 100
        self.collegeOpportunitiesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "ages = %@", "college")
        do {
            collegeOpportunities = try context.fetch(request) as! [Opportunity]
            if (collegeOpportunities.count == 0) {
                for i in 0 ... collegeOpportunities_titles.count - 1 {
                    var test: Opportunity = Opportunity(context: context)
                    test.title = collegeOpportunities_titles[i]
                    test.details = collegeOpportunities_details[i]
                    test.ages = "college"
                    collegeOpportunities.append(test)
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
            DispatchQueue.main.async {
                self.collegeOpportunitiesTableView.reloadData()
            }
            print(collegeOpportunities[0].title)
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(collegeOpportunities.count)
        return collegeOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = collegeOpportunitiesTableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = collegeOpportunities[indexPath.row].title
        cell.detailTextLabel?.text = collegeOpportunities[indexPath.row].details
        print("\(collegeOpportunities[indexPath.row].title ?? "n/a") \(collegeOpportunities[indexPath.row].details ?? "n/a")")
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
