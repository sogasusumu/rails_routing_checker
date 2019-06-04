rspec_install:
	spec/dummy/bin/rails generate rspec:install

linter:
	bundle exec rubocop ./lib -c .rubocop.yml -R -a

console:
	spec/dummy/bin/rails c

bundle:
	bundle install --path vendor/bundle

generate:
	spec/dummy/bin/rails g routing_checker create

lint:
	bundle exec rubocop lib/ -a
