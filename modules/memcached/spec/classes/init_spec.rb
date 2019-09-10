require 'spec_helper'
describe 'memcached' do
  context 'with default values for all parameters' do
    it { should contain_class('memcached') }
  end
end
