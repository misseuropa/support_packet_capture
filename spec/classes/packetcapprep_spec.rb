require 'spec_helper'

describe 'support_packet_capture::packetcapprep' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { should contain_package('tcpdump').
        with(
        'ensure' => 'latest',
      )}
      it { should contain_file('capscript').
        with(
        'ensure' => 'present',
        'path' => '/var/tmp/capscript.sh',
        'mode' => '0755',
      )}
    end
  end
end

describe 'support_packet_capture::packetcapprep' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do { 'remove' => true } end
      it { is_expected.to compile }
      it { should contain_package('tcpdump').
        with(
        'ensure' => 'absent',
      )}
      it { should contain_file('capscript').
        with(
        'ensure' => 'absent',
      )}
    end
  end
end
