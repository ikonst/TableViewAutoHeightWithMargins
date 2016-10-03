import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var innerView: UIView!
    @IBOutlet var label: UILabel?

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        if innerView.layoutMargins.bottom != 250 {
            print("WARNING: Layout margin bottom is not 250 during table cell height calculation")
        }
        return size
    }
}

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            as! MyCell
        cell.label?.text = "\(indexPath.row)"
        cell.innerView.preservesSuperviewLayoutMargins = (indexPath.row == 1)
        return cell
    }
}
