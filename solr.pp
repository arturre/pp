package {
      'solr':
        ensure  => present;
    }

package {
      'java-1.7.0-openjdk':
        ensure  => present;
    }

package {
      'java-1.7.0-openjdk-devel':
        ensure  => present;
    }

service { "solr":
    enable     => true,
    ensure     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => [ File["/etc/sysconfig/solr"]
                  ],
  }

file { "/etc/sysconfig/solr":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/solr/solr.tmpl"),
    notify  => Service["solr"],
    require => Package["solr"],
  }
