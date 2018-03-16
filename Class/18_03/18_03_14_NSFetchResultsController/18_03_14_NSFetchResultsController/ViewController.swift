//
//  ViewController.swift
//  18_03_14_NSFetchResultsController
//
//  Created by 배지호 on 2018. 3. 14..
//  Copyright © 2018년 baejiho. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
        var coreDataStack: CoreDataStack!
    lazy var fetchedResultController: NSFetchedResultsController<Team> = {
        let fetchRequest : NSFetchRequest<Team> = Team.fetchRequest()
        let zoneSort = NSSortDescriptor(key: #keyPath(Team.qualiftingZone), ascending: true)
        let scoreSort = NSSortDescriptor(key: #keyPath(Team.wins), ascending: false)
        let nameSort = NSSortDescriptor(key: #keyPath(Team.teamName), ascending: true)
        fetchRequest.sortDescriptors = [zoneSort,scoreSort,nameSort]
        let fetchedRequestsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.managedContext, sectionNameKeyPath: #keyPath(Team.qualiftingZone), cacheName: "_8_03_14_NSFetchResultsController")
        
        return fetchedRequestsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try fetchedResultController.performFetch()
            fetchedResultController.delegate = self
        } catch let error as NSError {
            print("Fetching error \(error), \(error.userInfo)")
        }
        print("\(fetchedResultController.sections!.count)")
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            addBtn.isEnabled = true
        }
    }
}

extension ViewController {
    func configure(cell: UITableViewCell, for indexPath: IndexPath) {
        guard let cell = cell as? TeamCell else { return }
        let team = fetchedResultController.object(at: indexPath)
        cell.nameLB.text = team.teamName
        cell.subLB.text = "Wins: \(team.wins)"
        
        if let imageName = team.imageName {
            cell.imgView.image = UIImage(named: imageName)
        } else {
            cell.imgView.image = nil
        }
    }
    
    @IBAction func addTeam(_ sender: AnyObject) {
        let alert = UIAlertController(title: "새로운 팀 추가", message: "새로운 팀 추가", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "팀 이름"
        }
        alert.addTextField { textField in
            textField.placeholder = "Qualift zone"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            guard let nameTextField = alert.textFields?.first,
                let zoneTextField = alert.textFields?.last else {return}
            let team = Team(context: self.coreDataStack.managedContext)
            team.teamName = nameTextField.text
            team.qualiftingZone = zoneTextField.text
            team.imageName = "wenderland-flag"
            self.coreDataStack.saveContext()
        }
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = fetchedResultController.sections else { return 0 }
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchedResultController.sections?[section] else { return 0 }
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TeamCell
        configure(cell: cell, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = fetchedResultController.sections?[section]
        return sectionInfo?.name
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = fetchedResultController.object(at: indexPath)
        team.wins = team.wins + 1
        coreDataStack.saveContext()
        tableView.reloadData()
    }
}

extension ViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        case .update:
            let cell = tableView.cellForRow(at: indexPath!) as! TeamCell
            configure(cell: cell, for: indexPath!)
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            tableView.insertSections(indexSet, with: .automatic)
        case .delete:
            tableView.deleteSections(indexSet, with: .automatic)
        default:
            break
        }
    }
    
}
