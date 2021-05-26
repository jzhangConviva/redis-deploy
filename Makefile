default: up run

.PHONY: up
up:
	 sudo docker build -t helm-val  .

.PHONY: run
run:
    sudo docker run -it --net host -u root --privileged helm-val sh -c 'bash sentinel/script.sh'

# .PHONY: run_cluster
# run_cluster:
#      sudo docker run -it --net host -u root --privileged helm-val sh -c 'bash cluster/script.sh'
#
