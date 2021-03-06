class SimpleViewController < UIViewController
  include SimpleView::Layout

  DEFAULT_CELL_ID = 'DefaultCellId'

  def viewDidLoad
    super

    @demos = [
      {caption: 'View Anchoring', controller: ViewAnchoringController}
    ]

    setup view, controller: self do
      controller.title = 'Demo'

      table_view delegate: controller, dataSource: controller, top: 0, left: 0, bottom: 0, right: 0 do
        view.registerClass UITableViewCell, forCellReuseIdentifier: DEFAULT_CELL_ID
      end
    end
  end

  # UITableView dataSource and delegate

  def numberOfSectionsInTableView tableView
    1
  end

  def tableView tableView, numberOfRowsInSection: section
    @demos.size
  end

  def tableView tableView, cellForRowAtIndexPath: indexPath
    cell = tableView.dequeueReusableCellWithIdentifier DEFAULT_CELL_ID
    cell.textLabel.text = @demos[indexPath.row][:caption]
    cell
  end

  def tableView tableView, didSelectRowAtIndexPath: indexPath
    tableView.deselectRowAtIndexPath indexPath, animated: true

    controller = @demos[indexPath.row][:controller].alloc.init
    navigationController.pushViewController controller, animated: true
  end
end