//
//  HomeViewController.swift
//  securityMemo
//
//  Created by haeseongJung on 2022/08/28.
//

import UIKit
import FSCalendar

class HomeViewController: UIViewController {
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendarViewConfigure()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Event
extension HomeViewController {
    @IBAction func settingPageOpen(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Setting", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        
        self.present(viewController, animated: true)
    }
}


//MARK: - Configure
extension HomeViewController {
    private func calendarViewConfigure() {
        calendarView.backgroundColor = UIColor(named: "Ivory")
        calendarView.appearance.headerTitleColor = UIColor(named: "Color3")
        calendarView.appearance.weekdayTextColor = UIColor(named: "Color3")
    }
}

//MARK: - TableviewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableViewCell") as? MemoTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = "11"
        cell.DateLabel.text = "2222"
        
        return cell
    }
}

//MARK: - TableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
}

//MARK: - FSCalendarDelegate
extension HomeViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date) + " 선택됨")
    }
}
//MARK: - FSCalendarDataSource
extension HomeViewController: FSCalendarDataSource {
    
}
