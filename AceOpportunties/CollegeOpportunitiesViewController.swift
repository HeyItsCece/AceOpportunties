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
    var collegeOpportunities_titles: [String] = ["On-Campus Internship","NYU Langone Health","NewYork Institute of Technology Lab Technician","Albert Einstein College of Medicine, Inc - Research Technician B","Jobs in Tech & StartUps - A Career Roundtable Event for Job Seekers","Multi-Profession Diversity Job Fair of Jersey City"]
    var collegeOpportunities_details: [String] = ["This is a two-semester, paid leadership internship for students of any major who would like to develop essential skills in management, budgeting, communication, public speaking, marketing, and event planning. An intern is to source and manage a team of student leaders to plan a series of life-changing events on campus. This allows students to gain real-life experience, go on an all-expenses paid retreat, it provides them with flexible hours around class schedules, and provides students with stipends.","The basic qualification for this role is to have a highschool diploma. This internship exposes students to real world experiences in the medical field; these candidates are responsible for processing, entering, and storing data from standardized questionnaires for the NYU Women's Health Study. They will also assist Research Coordinators with medical record requests to hospitals,review completeness/accuracy of follow-up questionnaires, Conduct phone calls to study participants, and more.","This is a full time job for college students pursuing Biology. NYIT‘s Department of Life Sciences, seeks a Lab Technician for the Long Island (Old Westbury campus). This job will require you to be knowledgeable of basic lab procedures/safety regulations; you must be able to prepare labs for general science classes, properly store lab equipment/specimens and chemicals, and maintain lab stations clean.","In this job, you are required to perform simple/moderately complex technical procedures, require guidance,  train/ guide other technical personnel, gain an understanding of simple scientific information, and have skills in the analysis/ interpretation of data.","This event hosts various start up businesses and helps expose you to potential jobs and opportunities in the tech field!","This event hosts various elmployers and has a great variety in different fields. This provides you with the opportunity to find a job in fields such as: Customer Service, Management, General Business, Marketing, Retail, Administrative, Insurance, Banking, Engineering, Accounting, Finance, Education, Law Enforcement, Government, Military, Hospitality, Human Resources, Technicians, Telemarketing, Healthcare, IT, and more."]
    var collegeOpportunities_links: [String] = ["https://www.linkedin.com/jobs/view/current-college-students-on-campus-internship-at-the-national-society-of-leadership-and-success-1294795391?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic","https://www.linkedin.com/jobs/view/student-intern-at-nyu-langone-health-1331749616?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic","https://www.linkedin.com/jobs/view/lab-technician-at-new-york-institute-of-technology-972696448?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic","https://careers-einstein.icims.com/jobs/11646/research-technician-b/login?utm_source=google_jobs_apply&utm_medium=organic&utm_campaign=google_jobs_apply&mobile=false&width=950&height=500&bga=true&needsRedirect=false&jan1offset=-300&jun1offset=-240","https://www.eventbrite.com/e/jobs-in-tech-startups-a-career-roundtable-event-for-job-seekers-tickets-62342709723","https://www.eventbrite.com/e/multi-profession-diversity-job-fair-of-jersey-city-tickets-60142339356"]
    
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
                    test.link = collegeOpportunities_links[i]
                    test.list = false
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
        cell.accessoryType = .detailDisclosureButton
        print("\(collegeOpportunities[indexPath.row].title ?? "n/a") \(collegeOpportunities[indexPath.row].details ?? "n/a")")
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        var url = URL(string:collegeOpportunities[indexPath.row].link!)
        UIApplication.shared.canOpenURL(url!)
        UIApplication.shared.open(url!, options: [:],completionHandler: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.collegeOpportunities[indexPath.row].list = true
            success(true)
        })
        modifyAction.title = "Add"
        modifyAction.backgroundColor = .blue
        
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
