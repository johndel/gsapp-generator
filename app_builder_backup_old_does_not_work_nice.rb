class AppBuilder < Rails::AppBuilder
  def readme
    create_file "README.md", "TODO"
  end

  def gemfile
    copy_file "#{Dir.pwd}/../templates/Gemfile", "Gemfile"
  end

  def gitignore
    copy_file "#{Dir.pwd}/../templates/.gitignore", ".gitignore"
  end

  def database_yml
    #template "config/databases/#{options[:database]}.yml", "config/database.yml"
    template "#{Dir.pwd}/../templates/database.yml.example.myosx", "config/database.yml.example.myosx"
    template "#{Dir.pwd}/../templates/database.yml.example.ubuntu", "config/database.yml.example.ubuntu"
    super
  end

  def test
    say "Rspec needs to be installed later. After bundle install run rails g rspec:install", :red
  end

  def leftovers
    remove_file "public/index.html"

    # I removed them first for not asking me to replace them
    remove_file "public/404.html"
    remove_file "public/422.html"
    remove_file "public/500.html"
    copy_file "#{Dir.pwd}/../templates/public/404.html", "public/404.html"
    copy_file "#{Dir.pwd}/../templates/public/422.html", "public/422.html"
    copy_file "#{Dir.pwd}/../templates/public/500.html", "public/500.html"

    # Copy Rake Tasks
    copy_file "#{Dir.pwd}/../templates/tasks/git.rake", "lib/tasks/git.rake"
    copy_file "#{Dir.pwd}/../templates/tasks/unsued_images.rake", "lib/tasks/unsued_images.rake"

    # Rails Best Practices
    copy_file "#{Dir.pwd}/../templates/rails_best_practices.yml", "public/rails_best_practices.yml"

    # Guardfile
    copy_file "#{Dir.pwd}/../templates/Guardfile", "Guardfile"

    # Append to environments/development.rb

    git :init
    git add: ".", commit: "-m 'initial commit'"
  end

end
