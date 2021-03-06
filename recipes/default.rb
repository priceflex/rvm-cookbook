node[:rvm_packages].each do |package_name|
  package package_name
end

bash "Installing rvm" do
  code "bash -s stable < <(curl -s #{node[:rvm_source]})"
  not_if "[ -d #{node[:rvm_path]} ]"
end

node[:rvm_rubies].each do |ruby|
  bash "RVM installing Ruby #{ruby}" do
    code %{
      #{node[:rvm_bin]} install #{ruby}
      #{node[:rvm_bin]} --create #{ruby}@global gem install #{node[:rvm_global_gems].join(' ')}
    }
    only_if "[ $(#{node[:rvm_bin]} list | grep -c #{ruby}) -eq 0 ]"
  end
end
