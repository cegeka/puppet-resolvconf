#!/usr/bin/env rspec

require 'spec_helper'

describe 'resolvconf' do
  it { should contain_class 'resolvconf' }
end
