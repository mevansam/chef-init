#
# Copyright:: Copyright (c) 2012-2014 Chef Software, Inc.
# License:: Apache License, Version 2.0
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

require 'chef/provider/supervisor/runit'

class Chef
  class Resource
    class Supervisor < Chef::Resource::Service

      def initialize(name, run_context = nil)
        super
        @resource_name = :service
        @provider = Chef::Provider::Supervisor::Runit
        @command = nil
        @enabled = false
      end

      def command(arg=nil)
        set_or_return(
          :command,
          arg,
          :kind_of => [ String ],
          :required => true
        )
      end
    end
  end
end

