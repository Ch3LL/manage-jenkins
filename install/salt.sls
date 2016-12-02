{# this sls will only work on centos vms #}

{# Import global parameters that source from grains and pillars #}
{% import 'args.jinja' as args %}

latest_salt_pkgrepo:
  pkgrepo.managed:
    - name: saltstack-latest
    - humanname: SaltStack latest repo for RHEL/CentOS $releasever
    - baseurl: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest
    - gpgcheck: 1
    - gpgkey: https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/SALTSTACK-GPG-KEY.pub

install_salt_minion:
  pkg.installed:
    - pkgs:
      - salt-minion
      - salt-master
    - require:
      - pkgrepo: latest_salt_pkgrepo
