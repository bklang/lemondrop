require 'spec_helper'

describe Lemondrop::Plugin::Service do
  subject { Lemondrop::Plugin::Service }

  describe '#start' do
    it 'should allow specifying a URI for the connection information' do
      config = {uri: 'redis://redisuser:redispass@foo.bar.com:9530/'}
      expected_params = {
        user: 'redisuser',
        password: 'redispass',
        host: 'foo.bar.com',
        port: 9530
      }
      subject.should_receive(:establish_connection).once.with(expected_params)
      subject.start config
    end

    it 'should default to the correct port if the URI does not specify one' do
      config = {uri: 'redis://redisuser:redispass@foo.bar.com/', port: 6379}
      expected_params = {
        user: 'redisuser',
        password: 'redispass',
        host: 'foo.bar.com',
        port: 6379
      }
      subject.should_receive(:establish_connection).once.with(expected_params)
      subject.start config
    end
  end

  describe '#establish_connection' do
    let(:params) { {} }

    it "returns a Redis instance" do
      subject.establish_connection(params).should be_a Redis
    end
  end
end
