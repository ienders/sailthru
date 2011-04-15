Gem::Specification.new do |s|
  s.name = %q{sailthru}
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ian Enders"]
  s.date = %q{2010-04-02}
  s.description = %q{Sailthru triggermail client.}
  s.email = %q{ian.enders@gmail.com}
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files = [
    ".gitignore",
     "README.txt",
     "VERSION",
     "lib/sailthru/client.rb",
     "lib/sailthru/triggermail_client.rb",
     "sailthru.gemspec"
  ]
  s.homepage = %q{http://github.com/ienders/sailthru}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Gemified Sailthru Client Library}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
