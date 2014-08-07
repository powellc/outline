---
server: staging.example.com
domainname: example.com
mode: Stage
deployment_name: outline
locale: en_US.UTF-8
timezone: America/New_York
port_number: 45001
project_repo: http://github.com/powellc/ouline.git
branch: master
dbpass: lkjxz;vkjsdaijlaksjdl;kj3
postgis: False
secret_key: LKJSDAELKJELFJKSOIJLPJPWEFLJSDFJEFKJE-EFKJDFXFJJ