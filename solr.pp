package {
      'java-1.7.0-openjdk':
        ensure  => present;
    }

    package {
      'java-1.7.0-openjdk-devel':
        ensure  => present;
    }

    exec {
      'download and install sorl':
        command => "/bin/echo 'cd /opt && /usr/bin/wget -O /opt/solr-5.3.0.tgz  http://apache.mirror.gtcomm.net/lucene/solr/5.3.0/solr-5.3.0.tgz && tar -xzf /opt/solr-5.3.0.tgz && rm -f /opt/solr-5.3.0.tgz && ln -s /opt/solr-5.3.0 /opt/solr && mv -v /opt/solr/example /opt/solr/core' | bash",
        require => Package['java-1.7.0-openjdk'];
    }
