require 'spec_helper'

describe Lemondrop do
  subject { Lemondrop::Plugin::Service }

  describe 'Lemondrop.do_something' do
    let(:connection) { double 'Lemondrop::Plugin::Service.connection' }

    it 'gets sent to Redis' do
      Lemondrop::Plugin::Service.stub(:connection).and_return connection
      connection.should_receive(:set).with "foo", "bar"

      Lemondrop.set "foo", "bar"
    end
  end
end
