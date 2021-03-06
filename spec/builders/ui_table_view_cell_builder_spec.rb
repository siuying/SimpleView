describe "UITableViewCellBuilder" do
  it "should build UITableViewCell" do
    view = SimpleView::Builders::UITableViewCellBuilder.new.build(UITableViewCell)
    view.class.should == UITableViewCell
    view.style.should == UITableViewCellStyleDefault
  end

  it "should build UITableViewCell with style" do
    view = SimpleView::Builders::UITableViewCellBuilder.new.build(UITableViewCell, style: UITableViewCellStyleSubtitle)
    view.style.should == UITableViewCellStyleSubtitle
  end

  it "should build UITableViewCell with style and reuseIdentifier" do
    view = SimpleView::Builders::UITableViewCellBuilder.new.build(UITableViewCell, reuseIdentifier: "CellIdentifier")
    view.reuseIdentifier.should == "CellIdentifier"
  end
end