Given 'a page "$name" exists' do |name|
  @page = FactoryGirl.create(:page, :name => name)
end

Given 'a page "$name" with "$content" content exists' do |name, content|
  FactoryGirl.create(:page, :name => name, :content => content)
end

Given '"$pages" page hierarchy exists' do |pages|
  parent_page = nil
  pages.split(' > ').each do |name|
    parent_page = FactoryGirl.create(:page, :name => name, :parent => parent_page)
  end
end

Given 'a hidden page "$name" exists' do |name|
  @page = FactoryGirl.create(:page, :name => name, :visible => false)
end

Given 'this page is uncommentable' do
  @page.update_attributes! :commentable => false
end

When 'I start creating a page' do
  visit admin_pages_path
  click_link 'Create a new page'
end

When 'I start editing the "$name" page' do |name|
  visit admin_pages_path
  click_link "Edit '#{name}' page"
end

When 'I submit the following page:' do |table|
  attributes = table.rows_hash
  attributes.each do |field_name, value|
    fill_in field_name, :with => value
  end

  click_button 'Page'
end

When 'I delete the "$name" page' do |name|
  visit admin_pages_path
  click_link "Delete '#{name}' page"

  page.should have_content('Page was successfully destroyed.')
end

When 'I submit a blank page' do
  click_button 'Page'
end

When 'I start creating a subpage of "$name"' do |name|
  visit admin_pages_path
  click_link "Add a subpage of '#{name}'"
end

When 'I mark the "$name" page as invisible' do |name|
  visit edit_admin_page_path(Page.find_by_name!(name))

  uncheck 'Visible'

  click_button 'Page'
end

When 'I submit the page' do
  click_button 'Page'
end

Then 'the "$name" page should be invisible' do |name|
  Page.find_by_name!(name).should_not be_visible
end

Then 'I should be able to edit and add subpages to "$page_name"' do |page_name|
  page.should have_content(page_name)
  page.should have_selector(%(a[title="Edit '#{page_name}' page"]))
  page.should have_selector(%(a[title="Add a subpage of '#{page_name}'"]))
end

Then 'we should have "$child_page_title" page as a subpage of "$parent_page_title"' do |child_page_title, parent_page_title|
  parent = Page.find_by_name! parent_page_title
  child  = Page.find_by_name! child_page_title

  parent.children.should == [child]
end

Then 'I should see error messages' do
  page.should have_content('Some errors were found, please take a look:')
end

Then 'we should have the following page:' do |table|
  attributes = table.rows_hash

  Page.where(attributes).should have(1).page
end

Then 'we should have no pages' do
  Page.count.should == 0
end

Then 'I should not be able to see the content of "$name"' do |name|
  page.should_not have_content(Page.find_by_name!(name).content)
end

Then 'I should be able to see the content of "$name"' do |name|
  page.should have_content(Page.find_by_name!(name).content)
end

Then 'I should not find this page' do
  page.driver.status_code.should == 404
end

Then '"$page_title" page should not be commentable' do |name|
  Page.find_by_name!(name).should_not be_commentable
end

Then 'I should not be able to comment on this page' do
  page.should_not have_css('#new-comment')

  -> {
    post page_comments_path(@page), :comment => {:foo => 'bar'}
  }.should raise_error("You can't comment on uncommentable entry")
end