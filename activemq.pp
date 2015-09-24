package {
      'activemq':
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

service { "activemq":
    enable     => true,
    ensure     => true,
    hasrestart => true,
    hasstatus  => true,
    subscribe  => [     File["/etc/sysconfig/activemq"],
                        File["/etc/activemq/activemq.xml"],
                        File["/etc/activemq/credentials.properties"],
                        File["/etc/activemq/jetty-realm.properties"],
                        File["/etc/activemq/jetty-realm.properties"],
                        File["/etc/activemq/jetty.xml"],
                        File["/etc/activemq/log4j.properties"],
                  ],
  }


file { "/etc/sysconfig/activemq":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/activemq/activemq.tmpl"),
    notify  => Service["activemq"],
    require => Package["activemq"],
  }


file { "/etc/activemq/activemq.xml":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/activemq/activemq.xml.tmpl"),
    notify  => Service["activemq"],
    require => Package["activemq"],
  }

file { "/etc/activemq/credentials.properties":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/activemq/credentials.properties.tmpl"),
    notify  => Service["activemq"],
    require => Package["activemq"],
  }

file { "/etc/activemq/jetty-realm.properties":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/activemq/jetty-realm.properties.tmpl"),
    notify  => Service["activemq"],
    require => Package["activemq"],
  }

file { "/etc/activemq/jetty.xml":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/activemq/jetty.xml.tmpl"),
    notify  => Service["activemq"],
    require => Package["activemq"],
  }

file { "/etc/activemq/log4j.properties":
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => template("/root/pp/activemq/log4j.properties.tmpl"),
    notify  => Service["activemq"],
    require => Package["activemq"],
  }
