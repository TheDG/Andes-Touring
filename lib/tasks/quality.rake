# frozen_string_literal: true

desc 'run linters'
task :linters do
  sh('./node_modules/.bin/eslint --ext .js,.es6 app/webpack')
  sh('rubocop')
  sh('reek')
end

task :quality do
  sh 'bundle outdated --strict --no-local'
  sh 'bundle-audit check --update'
  sh('./node_modules/.bin/eslint --ext .js,.es6 app/webpack')
  sh('rubocop')
  sh('reek')
  sh('flay')
  sh('rspec')
  sh('brakeman')
end
