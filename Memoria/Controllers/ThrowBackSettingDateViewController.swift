

import UIKit
import UserNotifications

class ThrowBackSettingDateViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        for i in 0...100 {
            let content = UNMutableNotificationContent()
            
            if let text = textField.text {
                content.title = textField.text!
            }
            content.sound = .default
            
            var notificationTime = DateComponents()
            
            // monthの設定
            notificationTime.month = Calendar.current.component(.month, from: datePicker.date)
            //dayの設定
            notificationTime.day = Calendar.current.component(.day, from: datePicker.date)
            
            notificationTime.year = Calendar.current.component(.year, from: datePicker.date) + i
            
            // トリガーの作成
            let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
            // トリガーをもとに通知のリクエストを登録
            let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
            
            // トリガーの登録
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
        
        
        
//        performSegue(withIdentifier: "backToTb", sender: nil)
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
