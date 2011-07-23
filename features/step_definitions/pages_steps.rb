Given 'a page "$title" exits' do |title|
  Factory(:page, :title => title)
end

When 'I create a page:' do |table|
  attributes = table.rows_hash

  visit admin_pages_path
  click_link 'Create a new page'

  fill_in 'Title', :with => attributes['Title']
  fill_in 'Content', :with => attributes['Content']

  click_button 'Create Page'

  page.should have_content('Page was successfully created.')
  page.should have_content(attributes['Title'])
end

When 'I update the "$title" page with:' do |title, table|
  attributes = table.rows_hash

  visit admin_pages_path
  click_link "Edit '#{title}' page"

  attributes.each do |field_name, value|
    fill_in field_name, :with => value
  end

  click_button 'Update Page'

  page.should have_content('Page was successfully updated.')
  page.should have_content(attributes['Title']) if attributes['Title'].present?
end

When 'I delete the "$title" page' do |title|
  visit admin_pages_path
  click_link "Delete '#{title}' page"

  page.should have_content('Page was successfully destroyed.')
end

Then 'we should have the following page:' do |table|
  attributes = table.rows_hash

  Page.where(attributes).should have(1).page
end

Then 'we should have no pages' do
  Page.count.should == 0
end