Given 'a page "$name" exits' do |name|
  Factory(:page, :name => name)
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