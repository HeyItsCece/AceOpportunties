//
//  HSOpportunitiesViewController.swift
//  AceOpportunties
//
//  Created by Girls Who Code on 7/16/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit
import CoreData

class HSOpportunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    ///////////// OUTLETS ///////////////
    @IBOutlet weak var hsOpportunitiesTableView: UITableView!
    
    //////////// VARIABLES //////////////
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var hsOpportunities: [Opportunity] = []
    var hsOpportunities_titles: [String] = ["Girls Who Code Campus","STEM matters","Girls Who Code summer immersion","DNA Learning Center STARS STEM program","New York City Department of Finance","Amplify Internship"]
    var hsOpportunities_details: [String] = ["The Girls Who Code campus program is a two week program which introduces girls from ages  10- 18 to computer science. It offers various courses such as: Intro to computer science, Iphone App development 1,Iphone App development 2,and Web Design. It is held in cities like NYC, los Angeles,Seattle,Boston, Bay Area, and more. Aside from this, Girls Who Code offers discounts and need based scholarships!","This program is for students in grades K-11. This program offers different materials in topics from aerospace to animal science, marine biology to mechanics, and ecology to engineering. This also allows for week long programs, highschool internships, and four week long programs that allow for college credit!","This 7 week long program is for girls in 10th and 11th grade (going into junior or senior year) and it is a FREE program due to their need based stipends. This program introduces girls to computer science and its different applications, it allows them to build a sisterhood, and the professional company host sites allows them to build a network!","This 2 week program has a $1200 fee, however, it is waived for underrepresented minorities and It is held in Long Island, New York. This camp allows students to explore STEM fields, it gives them hands on experience, and it builds skills in molecular biology, coding and data science,and career skills for success!","This is a paid internship ($13/hr) and it is for highschool students interested in business or finance. This provides them with real-world job experience, essential skills, and it is a new opportunity for them to explore potential careers and opportunities/networking!","Amplify is a company that provides educational technology and curriculums. In this program, interns “help create and grow innovative products” and they are required to work alongside Amplify employees, participate in hands on experience, and  support teams through creativity and time efficiency."]
    
    //////////// FUNCTIONS /////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
        self.hsOpportunitiesTableView.estimatedRowHeight = 100
        self.hsOpportunitiesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func getData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Opportunity")
        request.predicate = NSPredicate(format: "ages = %@", "HS")
        do {
            hsOpportunities = try context.fetch(request) as! [Opportunity]
            if (hsOpportunities.count == 0) {
                for i in 0 ... hsOpportunities_titles.count - 1 {
                    var test: Opportunity = Opportunity(context: context)
                    test.title = hsOpportunities_titles[i]
                    test.details = hsOpportunities_details[i]
                    test.ages = "HS"
                    hsOpportunities.append(test)
                }
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
            DispatchQueue.main.async {
                self.hsOpportunitiesTableView.reloadData()
            }
            print(hsOpportunities[0].title)
        } catch {
            print("Couldn't fetch data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(hsOpportunities.count)
        return hsOpportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hsOpportunitiesTableView.dequeueReusableCell(withIdentifier: "hsCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = hsOpportunities[indexPath.row].title
        cell.detailTextLabel?.text = hsOpportunities[indexPath.row].details
        print("\(hsOpportunities[indexPath.row].title ?? "n/a") \(hsOpportunities[indexPath.row].details ?? "n/a")")
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
