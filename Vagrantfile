#!/usr/bin/env ruby
#^syntax detection

project_name = 'varnalab_site'
     
Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.network "33.33.33.10"
  config.vm.forward_port("80", 80, 8080)
  config.vm.forward_port("3010", 3010, 3030,:auto => true)
  config.vm.share_folder("v-root", "/vagrant", ".")
  #config.vm.share_folder("v-srv", "/srv", "/srv")
  #config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  #config.vm.share_folder("v-srv", "/srv", "/srv", :nfs => true)
  
  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug # config.log_level
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe 'build-essential'
    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "sqlite"
    chef.add_recipe "nginx::source"
    chef.add_recipe 'rvm_passenger'
    chef.add_recipe 'rvm_passenger::nginx'
    chef.add_recipe 'rvm'
    chef.add_recipe 'rvm::user'
    chef.add_recipe 'rvm::vagrant'

    chef.json = {
      :rvm => {
        :user_installs =>  [
          {
            'user'          => 'vagrant',
            'default_ruby'  => '1.9.2@varnalab_site',
            'rubies'        => ['1.9.2'], 
          
            :rvmrc => {
              'rvm_project_rvmrc'             => 1,
              'rvm_gemset_create_on_use_flag' => 1,
              'rvm_pretty_print_flag'         => 1 },
          
            :global_gems => [
              { 'name'    => 'bundler' },
              { 'name'    => 'rake'},
              { 'name'    => 'passenger'}
            ]

          }],
        
        :user_global_gems => [
          { 'name'    => 'bundler'},
          { 'name'    => 'rake'},
          { 'name'    => 'passenger'}
        ]
      },
       
      :rvm_passenger => { :rvm_ruby => '1.9.2@varnalab_site' },
      
      :nginx => {
        :user => 'vagrant',
        :install_path => '/opt/nginx',
        :dir => '/opt/nginx',
        :version => '1.0.5'}, 
     
      :vagrant_project => {
        :name => project_name,
        :port => '3010',
        :dir => '/vagrant/public'}
    }
   end
end
