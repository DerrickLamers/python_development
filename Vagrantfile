Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.hostname = 'python-development'

  config.vm.network "forwarded_port", guest: 80, host: 8080
  10.times do |n|
    config.vm.network 'forwarded_port',
                      guest: 3000 + n,
                      host: 4000 + n
  end

  config.vm.provision :shell,
                      path: 'bootstrap.sh',
                      keep_color: true,
                      privileged: false
end
