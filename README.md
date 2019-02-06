Ansible Role `pandorafms_server`
=========

An ansible role to install [Pandora FMS](https://pandorafms.org) server.

Requirements
------------

A running MySQL instance that has completed its [initial configuration](https://wiki.pandorafms.com/index.php?title=Pandora:Documentation_en:Installing#Initial_Console_Configuration) if you want to start `pandora_server` service.

Role Variables
--------------

Variable | Default | Description
---------|---------|------------
`pandorafms_server_version` | - | The version of the Pandora FMS console to install. When `null`, latest package on the repository will be installed.
`pandorafms_server_dbhost`| `{{ pandorafms_dbhost | default('localhost') }}` | The IP address or hostname of the DB instance to create database for Pandora FMS.
`pandorafms_server_dbname`| `{{ pandorafms_dbname | default('pandora') }}`  | The name of the Pandora FMS database.
`pandorafms_server_dbuser`| `{{ pandorafms_dbname | default('pandora') }}`  | The username for the Pandora FMS database.
`pandorafms_server_dbpass`| `{{ pandorafms_dbname | default('pandora') }}`  | The password of the `pandorafms_dbuser`
`pandorafms_server_dbport`| `{{ pandorafms_dbname | default(omit) }}`   | The port number used for connecting to database.
`pandorafms_server_service_enabled`| - | When set to `true` or `false`, `pandora_server` serivce will be enabled/diable.
`pandorafms_server_service_state`  | - | When set, state of `pandora_server` serivce will be changed to specified state.

Dependencies
------------

- rworksjp.repo-pandorafms

Example Playbook
----------------

```
# Only install package
- hosts: servers
  roles:
    - role: rworksjp.pandorafms_server

# Install Pandora FMS server 7.0NG.719, enable and start pandora_server service
- hosts: servers
  roles:
    - role: rworksjp.pandorafms_console
      pandorafms_server_version: 7.0NG.719
      pandorafms_server_service_enabled: true
      pandorafms_server_service_state: started
```

License
-------

BSD
