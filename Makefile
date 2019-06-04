rspec_install:
	spec/dummy/bin/rails generate rspec:install

linter:
	bundle exec rubocop ./lib -c .rubocop.yml -R -a

console:
	spec/dummy/bin/rails c
