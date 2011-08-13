Dir[Rails.root.join('lib', 'extensions', '*rb')].each do |extension|
  require extension
end
