{# this sls will only work on centos vms #}

{# Import global parameters that source from grains and pillars #}
{% import 'args.jinja' as args %}

install_salt_repo:
  pkg.installed:
    - name: salt_repo
    - sources:
      - salt-repo-latest-1: https://repo.saltstack.com/yum/redhat/salt-repo-latest-1.el{{ args.os_release }}.noarch.rpm

install_salt_minion:
  pkg.installed:
    - pkgs:
      - salt-minion
      - salt-master
    - require:
      - pkg: install_salt_repo
