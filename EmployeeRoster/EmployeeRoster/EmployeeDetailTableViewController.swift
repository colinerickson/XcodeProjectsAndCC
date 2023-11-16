
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {

    @IBOutlet weak var dobDatePicker: UIDatePicker!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    let myIndexPath = IndexPath(row: 2, section: 0)
    let datePickerIndexPath = IndexPath(row: 2, section: 0)
    var isEditingBirthday = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    var employeeType: EmployeeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    private func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false && employeeType != nil
        saveBarButtonItem.isEnabled = shouldEnableSaveButton
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        
        guard let unwrappedEmployeeType = employeeType else  {
            return
        }
        
        let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: unwrappedEmployeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == myIndexPath && !isEditingBirthday {
            return 0
        } else if indexPath.section == 0 && indexPath.row == 2 {
                return 200
            } else {
                return UITableView.automaticDimension
            }
        }
//        if indexPath == myIndexPath && !isEditingBirthday {
//            return 0
//        } else {
//            return UITableView.automaticDimension
//        }
//
//    }
    func updateDueDateLabel(date: Date) {
//        dobLabel.text = date.formatted(.dateTime.month(.defaultDDigits).day().year(.twoDigits))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        dateFormatter.timeZone = TimeZone.current
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == IndexPath(row: 1, section: 0) {
            isEditingBirthday.toggle()
            dobLabel.textColor = .label
            updateDueDateLabel(date: dobDatePicker.date)
            
        }
    }
    @IBAction func dobDatePickerTapped(_ sender: UIDatePicker) {
//        dobLabel.text = sender.date.formatted()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        dobLabel.text = dateFormatter.string(from: sender.date)
    }
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let vc = EmployeeTypeTableViewController(coder: coder)
        vc?.delegate = self
        return vc
    }
    
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description
        updateSaveButtonState()
    }
}
