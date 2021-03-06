maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs RVM as root, shared across all users"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.2"

depends "bootstrap"

recipe "rvm", "Installs RVM as root, shared across all users"
recipe "rvm::users", "Sets up rvm for specific users"
