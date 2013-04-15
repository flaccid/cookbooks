# Cookbook Name:: concrete5
# Recipe:: default
#
# Copyright 2013, Chris Fordham
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

include_recipe "git" if node['concrete5']['install']['git']

if node['concrete5']['install']['source_only']
  directory node['concrete5']['install']['source_destination']
  deploy_revision "#{node['concrete5']['install']['source_destination']}" do
    repo node['concrete5']['install']['source_url']
  end
else
  include_recipe "concrete5::application"
end