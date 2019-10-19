
import UIKit

let screenWidth  = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

func NavigationBarHeight() -> CGFloat {
    
    let mainWindow : UIWindow = ((UIApplication.shared.delegate?.window)!)!
    if #available(iOS 11.0, *) {
        if mainWindow.safeAreaInsets.bottom > 0.0{
            return 88.0
        }
    }
    return 64.0
}

class ViewController: UIViewController {

    private lazy var tableview : UITableView = {
        let rect = CGRect.init(x: 0, y: NavigationBarHeight(), width: screenWidth, height: screenHeight)
        let tableview = UITableView.init(frame: rect, style: UITableView.Style.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 50
        tableview.tableFooterView = UIView.init()
        tableview.tableHeaderView = UIView.init()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.cellForRow(at: indexPath)
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellid")
        }
        cell?.textLabel?.text = "1111"
        cell?.detailTextLabel?.text = "222"
        cell?.imageView?.backgroundColor = UIColor.red
        return cell!
    }
}

extension ViewController {
    
    @objc func addEntryModel() {
        let alert = UIAlertController.init(title: "Please enter", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Title"
            textfield.clearButtonMode = .whileEditing
//            textfield.becomeFirstResponder()
            
        }
        alert.addTextField { (textfield) in
            textfield.placeholder = "Password"
            textfield.clearButtonMode = .whileEditing
            textfield.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction.init(title: "Add", style: UIAlertAction.Style.destructive, handler: { (action) in
            
        }))
        self.present(alert, animated: true) {
            
        }
    }
}

extension ViewController {
    
    func initUI() -> Void {
        
        view.backgroundColor = .white
        title = "Word"
        view.addSubview(self.tableview)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addEntryModel))
                
    }
    
}

class EntryModel : NSObject{
    
    var title: String?
    var password: String?

    required override init() {}
    
}

