generate('rspec:install')

lines = File.readlines("./spec/spec_helper.rb")
lines.each_with_index do |line,i|
  if line.include?("require") && line.match(%r{('|")rspec/rails('|")})
    lines.insert(i+1,%q{require "rspec/rails/extra/routing"})
    break
  end
end

File.open("./spec/spec_helper.rb","w"){|f| f << lines.join}

generate('controller wombats index') # plural
generate('controller welcome index') # singular
generate('integration_test widgets')
generate('mailer Notifications signup')
generate('model thing name:string')
generate('helper things')
generate('scaffold widget name:string category:string instock:boolean --force')
generate('observer widget')
generate('scaffold gadget') # scaffold with no attributes
generate('scaffold admin/accounts name:string') # scaffold with nested resource

run('rake db:migrate')
run('rake db:test:prepare')
