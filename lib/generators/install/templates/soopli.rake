namespace :soopli do
  desc "Create root user"
  task :create_statuses => :environment do
    Soopli::Status.create(name: 'Pipeline', id: 1)
    Soopli::Status.create(name: 'Active', id: 2)
    Soopli::Status.create(name: 'Archived', id: 3)
  end

  desc "Run all tasks"
  task :all => [:create_statuses]
end
