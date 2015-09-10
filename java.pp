package {
      'java-1.7.0-openjdk':
        ensure  => present;
    }

    package {
      'java-1.7.0-openjdk-devel':
        ensure  => present;
    }

    exec {
      'default java':
        command => '/usr/sbin/alternatives --install /usr/bin/java  java /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java 1',
        require => Package['java-1.7.0-openjdk'];
    }

    exec {
      'default Javac':
        command => '/usr/sbin/alternatives --install /usr/bin/javac  javac /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/javac 1',
        require => Package['java-1.7.0-openjdk'];
    }
