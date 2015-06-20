# == Class: razor::server::database

class razor::server::database {
  class { '::postgresql::globals':
    manage_package_repo => true,
    version             => '9.4'
  }

  class { '::postgresql::server': }

  postgresql::server::db { $::razor::server::db_database:
    user     => $::razor::server::db_username,
    password => $::razor::server::db_password,
    grant    => 'all',
  }
}