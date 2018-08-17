  ansible nodes -m shell -a "systemctl stop docker ; yum remove docker docker-common -y ; rm -Rf /var/lib/docker/* ; yum clean all ; rm -rf /var/cache/yum"
  ansible nodes -m parted -a "device=/dev/sdc number=1 state=absent"
  ansible nodes -m shell -a "wipefs -a /dev/sdc"
  ansible nodes -m shell -a "yum install docker -y"
  ansible nodes -m shell -a "echo DEVS=/dev/sdc > /etc/sysconfig/docker-storage-setup ; echo VG=docker-vg >> /etc/sysconfig/docker-storage-setup"
  ansible nodes -m shell -a "docker-storage-setup"
  ansible nodes -m shell -a "systemctl enable docker ; systemctl start docker"


  ansible nodes -m shell -a "docker pull registry.access.redhat.com/openshift3/ose-haproxy-router:v3.9.40  ; docker pull registry.access.redhat.com/openshift3/ose-deployer:v3.9.40 ; docker pull registry.access.redhat.com/openshift3/ose-pod:v3.9.40 ; docker pull registry.access.redhat.com/openshift3/ose-keepalived-ipfailover:v3.9.40 ; docker pull registry.access.redhat.com/openshift3/ose-docker-registry:v3.9.40"

 ansible nodes -m shell -a "docker pull registry.access.redhat.com/openshift3/metrics-cassandra ; docker pull registry.access.redhat.com/openshift3/metrics-heapster ; docker pull registry.access.redhat.com/openshift3/metrics-hawkular-metrics"
   
 ansible compute -m shell -a "docker pull registry.access.redhat.com/openshift3/ose-sti-builder:v3.9.40 ; docker pull registry.access.redhat.com/openshift3/ruby-20-rhel7 ; docker pull registry.access.redhat.com/openshift3/mysql-55-rhel7 ; docker pull openshift/hello-openshift:v1.2.1"


