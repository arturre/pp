1  wget --no-check-certificate  https://pkgs.fedoraproject.org/repo/pkgs/puppet/puppet-0.25.6.tar.gz/b8f1b58a300bcb2389a7a0612ee5fa05/puppet-0.25.6.tar.gz
    2  tar -xzvf puppet-0.25.6.tar.gz
    3  cd puppet-0.25.6
    4  yum search ruby
    5  w
    6  ruby install.rb
    7  cd ..
    8  wget
    9  wget
   10  wget http://downloads.puppetlabs.com/facter/facter-1.7.6.tar.gz
   11  tar -xzvf facter-1.7.6.tar.gz
   12  cd facter-1.7.6
   13  ls -la
   14  ruby install.rb
   15  facter
   16  cd ..
   17  cd puppet-0.25.6
   18  ruby install.rb
   19  puppet -V
   20  pwd
   21  cd
   22  mkdir 1
   23  cd 1
   24  vi java.pp
   25  puppet -v java.pp
   26  java -v
   27  rm java.pp java.pp
   28  vi java.pp
   29  puppet -v java.pp
   30  java -v
   31  puppet -v java.pp
   32  vi java.pp
   33  puppet -v java.pp
   34  vi java.pp
   35  puppet -v java.pp
   36  which alternatives
   37  vi java.pp
   38  puppet -v java.pp
   39  rpm -qa | grep jdk
   40  alternatives -h
   41  vi java.pp
   42  puppet -v java.pp
   43  java -v
   44  java -V
   45  java -version
   46  vi java.pp
   47  javac -version
   48  which javac
   49  puppet -v java.pp
   50  cat java.pp
   51  cat /etc/redhat-release
   52  puppet -V
   53  yum search activemq
   54  subscription-manager repos --enable=repoid
   55  yum search subscription
   56  wget http://jpackage.org/jpackage50.repo -O /etc/yum.repos.d/jpackage50.repo
   57  yum  update
   58  yum search sorl
   59  yum search solr
   60  yum search activemq
   61   vi activemq.pp
   62  history
   63  cat /etc/yum.repos.d/jpackage50.repo
   64  wget http://www.jpackage.org/jpackage.asc
   65  vi jpackage.asc
   66  rpm import http://www.jpackage.org/jpackage.asc
   67  rpm --import http://www.jpackage.org/jpackage.asc
   68  rpm -y  --import http://www.jpackage.org/jpackage.asc
   69  rpm  --import http://www.jpackage.org/jpackage.asc -y
   70  cat java.pp
   71  w
   72  top
   73  history



cat java.pp
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



exec {
      'enable jpackage':
        command => '/usr/bin/wget http://jpackage.org/jpackage50.repo -O /etc/yum.repos.d/jpackage50.repo';
    }

    exec {
      'import jpackage key':
        command => '/bin/rpm --import http://www.jpackage.org/jpackage.asc';
    }

   package {
      'activemq4.noarch':
        ensure  => present;
    }

    package {
      'activemq4-console.noarch':
        ensure  => present;
    }
