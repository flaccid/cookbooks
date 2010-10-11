#
# Cookbook Name:: postgresql
# Recipe:: server
#
# Copyright 2010, Chris Fordham.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "postgresql::client" 

package "postgresql"

case node.platform
when "redhat","centos","fedora","suse"
  package "postgresql-server"
end

service "postgresql" do
  case node[:platform]
  when "debian","ubuntu"
    service_name "postgresql-#{node[:postgresql][:version]}"
  end
  supports :restart => true, :status => true, :reload => true
  action :nothing
end
