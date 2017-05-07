%:
	. /etc/kayna/kayna.conf && \
	echo "$$KNOWN_DISTS" | xargs -n1 echo > known-dists
	docker build -t $@ .
