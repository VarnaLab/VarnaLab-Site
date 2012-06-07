Given 'an event "$name" exists' do |name|
  @event = FactoryGirl.create(:event, :title => name)
end

Given 'an event "$title" with "$body" body exists' do |title, body|
  FactoryGirl.create(:event, :title => title, :body => body)
end

When 'I start creating an event' do
  visit admin_events_path
  sign_in
  click_link 'Create a new event'
end

When 'I start editing the "$title" event' do |title|
  visit admin_events_path
  sign_in
  click_link "Edit '#{title}' event"
end

When 'I submit the following event:' do |table|
  attributes = table.rows_hash
  attributes.each do |field_name, value|
    fill_in field_name, :with => value
  end

  click_button 'Event'
end

When 'I delete the "$title" event' do |title|
  visit admin_events_path
  sign_in
  click_link "Delete '#{title}' event"
  event.should have_content('Event was successfully destroyed.')
end

When 'I submit a blank event' do
  click_button 'Event'
end

When 'I submit the event' do
  click_button 'Event'
end

Then 'I should be able to edit "$event_title"' do |event_title|
  event.should have_content(event_title)
  event.should have_selector(%(a[title="Edit '#{event_title}' event"]))
end

Then 'I should see some error messages' do
  event.should have_content('Some errors were found, please take a look again:')
end

Then 'we should have the following event:' do |table|
  attributes = table.rows_hash

  Event.where(attributes).should have(1).event
end

Then 'we should have no events' do
  Event.count.should == 0
end

Then 'I should not be able to see the body of "$title"' do |title|
  event.should_not have_content(Event.find_by_title!(title).body)
end

Then 'I should be able to see the place of "$title"' do |title|
  event.should have_content(Event.find_by_title!(title).body)
end

Then 'I should not find this event' do
  event.driver.status_code.should == 404
end