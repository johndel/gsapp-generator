# I removed the files first and then copy them
# because I don't want to ask me for replace


# README
create_file "README.md", "TODO"

# Gemfile
remove_file "Gemfile"
copy_file "#{Dir.pwd}/../templates/Gemfile", "Gemfile"

# Gitignore
remove_file ".gitignore"
copy_file "#{Dir.pwd}/../templates/.gitignore", ".gitignore"

# Database Examples
template "#{Dir.pwd}/../templates/database.yml.example.myosx", "config/database.yml.example.myosx"
template "#{Dir.pwd}/../templates/database.yml.example.ubuntu", "config/database.yml.example.ubuntu"

# Public Files
remove_file "public/index.html"
remove_file "public/404.html"
remove_file "public/422.html"
remove_file "public/500.html"
copy_file "#{Dir.pwd}/../templates/public/404.html", "public/404.html"
copy_file "#{Dir.pwd}/../templates/public/422.html", "public/422.html"
copy_file "#{Dir.pwd}/../templates/public/500.html", "public/500.html"

# Copy Rake Tasks
copy_file "#{Dir.pwd}/../templates/tasks/git.rake", "lib/tasks/git.rake"
copy_file "#{Dir.pwd}/../templates/tasks/unused_images.rake", "lib/tasks/unused_images.rake"

# Rails Best Practices
copy_file "#{Dir.pwd}/../templates/rails_best_practices.yml", "config/rails_best_practices.yml"

# Guardfile
copy_file "#{Dir.pwd}/../templates/Guardfile", "Guardfile"

# Appends to development.rb the letter_opener and bullet configuration
insert_into_file "config/environments/development.rb", after: "Application.configure do\n" do
  "  config.action_mailer.delivery_method = :letter_opener
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end\n"
end

# Rspec Install
run 'bundle install'
generate 'rspec:install'
remove_file "spec/spec_helper.rb"
copy_file "#{Dir.pwd}/../templates/spec_helper.rb", "spec/spec_helper.rb"

# Letter Opener Macros
copy_file "#{Dir.pwd}/../templates/spec_support/mailer_macros.rb", "spec/support/mailer_macros.rb"


git :init
git add: ".", commit: "-m 'initial commit'"


