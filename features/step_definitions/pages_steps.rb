Given 'a page "$name" exits' do |name|
  Factory(:page, :name => name)
end

When 'I create a page:' do |table|
  attributes = table.rows_hash

  visit admin_pages_path
  click_link 'Create a new page'

  attributes.each do |field_name, value|
    fill_in field_name, :with => value
  end

  click_button 'Create Page'

  page.should have_content('Page was successfully created.')
end

When 'I update the "$name" page with:' do |name, table|
  attributes = table.rows_hash

  visit admin_pages_path
  click_link "Edit '#{name}' page"

  attributes.each do |field_name, value|
    fill_in field_name, :with => value
  end

  click_button 'Update Page'

  page.should have_content('Page was successfully updated.')
end

When 'I delete the "$name" page' do |name|
  visit admin_pages_path
  click_link "Delete '#{name}' page"

  page.should have_content('Page was successfully destroyed.')
end

When 'I try to create a blank page' do
  visit admin_pages_path
  click_link 'Create a new page'
  click_button 'Create Page'
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