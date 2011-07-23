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

Then 'we should have the following page:' do |table|
  attributes = table.rows_hash

  Page.where(attributes).should have(1).page
end