Used software:

1. Java 1.7.0.79 (above 67 due to issue with tests)
2. Maven 3.2.2
  * maven settings.xml (wth nexus credentials)
3. VirtualBox 5.0.6
4. Vargrant 1.7.4
  * vagrant plugin install vagrant-hosts
5. Jenkins 1.638
  * plugins: git:2.4.0, git-client:1.19.0, timestamper:1.7.2
  * run as admin user
6. Nexus 2.11.4-01
7. Windows host:
  * ~~add to %windir%\System32\drivers\etc\hosts: 192.168.33.11 www.appsetup_proxy_1.com~~ (automated)
  * ~~add wget 64 binary https://eternallybored.org/misc/wget/ to %windir%\System32~~ (added to source control)
