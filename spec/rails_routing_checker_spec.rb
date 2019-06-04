require 'rails_helper'

describe 'RailsRoutingChecker' do
  let(:klass) { RailsRoutingChecker }
  let(:allow_actions) { klass.send(:allow_actions) }
  let :attr do
    [
        { controller: 'valid_controller', action: 'index' },
        { controller: 'valid_controller', action: 'show' },
        { controller: 'valid_controller', action: 'create' },
        { controller: 'valid_controller', action: 'update' },
        { controller: 'valid_controller', action: 'delete' }
    ]
  end
  let :invalid_attr do
    { controller: 'invalid_controller', action: 'invalid' }
  end

  describe '.valid!' do
    let(:actual) { klass.valid!(param, allow_actions) }
    context 'if valid param' do
      let(:param) { attr }
      let(:expected) { [] }
      it 'nothing raise return empty array.' do
        expect(actual).to eq expected
      end
    end
    context 'if invalid param' do
      let(:param) { attr << invalid_attr }
      it 'raise RailsRoutingChecker::Error' do
        expect { klass.valid!(param, allow_actions) }.to raise_error(RailsRoutingChecker::Error)
      end
    end
  end
end
