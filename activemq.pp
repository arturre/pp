package {
      'java-1.7.0-openjdk':
        ensure  => present;
    }

    package {
      'java-1.7.0-openjdk-devel':
        ensure  => present;
    }

    exec {
      'download  and install activemq':
        command => "/bin/echo 'cd /opt && /usr/bin/wget -O /opt/apache-activemq-5.12.0-bin.tar.gz  http://apache.mirror.vexxhost.com/activemq/5.12.0/apache-activemq-5.12.0-bin.tar.gz  && tar -xzf /opt/apache-activemq-5.12.0-bin.tar.gz && rm -f apache-activemq-5.12.0-bin.tar.gz  && ln -s /opt/apache-activemq-5.12.0 /opt/activemq' | bash",
        require => Package['java-1.7.0-openjdk'];
    }
