require 'spec_helper'
describe 'x509' do

  context 'with defaults for all parameters' do
    it { should contain_class('x509') }
  end
end
