require 'spec_helper_acceptance'

describe 'resolvconf' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        resolvconf::file { '/etc/resolvconf': ## /etc/resolv.conf cannot be owervritten in Docker
          nameserver => [ '8.8.8.8', '8.8.4.4' ],
          search     => [ 'example.lan', 'example.com' ],
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file('/etc/resolvconf') do
      it { should be_file }
      its(:content) { should match /search example.lan/ }
      its(:content) { should match /nameserver 8.8.8.8/ }
    end
  end
end
