---
server: www.example.com
domainname: example.me
mode: Prod
deployment_name: outline
locale: en_US.UTF-8
timezone: America/New_York
port_number: 45000
project_repo: git@github.com:powellc/outline.git
branch: master
dbpassword: jzxovijlsakdfj0ojookfjl32k3jrl
postgis: False
bower: False
secret_key: ALKJSDFLKXJCOVIJSELKJFEWLKJSLDFKJLEKJ-KLEJWLFEKJ