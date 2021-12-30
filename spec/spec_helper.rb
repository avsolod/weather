require 'shoulda-matchers'
require 'factory_girl'
require 'database_cleaner'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.library :active_record
    with.test_framework :rspec
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.include(FactoryGirl::Syntax::Methods)
  config.before(:suite) do
    FactoryGirl.find_definitions
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
