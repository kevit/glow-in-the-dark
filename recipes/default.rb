apt_repository "docker" do
   uri "https://get.docker.io/ubuntu"
   distribution "docker"
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "36A1D7869245C8950F966E92D8576A8BA88D21E9"
end

#apt-get update hack
include_recipe "apt"

package "lxc-docker" do
  action :install
end

# Pull latest registry image
 docker_image 'registry'

# # Run container exposing ports
docker_container 'docker-registry' do
   detach true
   port '5000:5000'
   env 'DOCKER_REGISTRY_CONFIG=/registry-conf/config.yml'
   volume '/mnt/docker:/docker-storage'
   volume '/home/user/registry-conf:/registry-conf'
end
