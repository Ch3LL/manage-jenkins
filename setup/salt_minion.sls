{% import 'args.jinja' as args %}

add_minion_id_and_master:
  file.managed:
    - name: /etc/salt/minion.d/setup.conf
    - contents: |
        id: {{ args.minion_id }}
        master: {{ args.master_id }}

minion_service:
  service.running:
    - name: salt-minion
    - watch:
      - file: add_minion_id_and_master
