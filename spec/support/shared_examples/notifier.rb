# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'create_notification' do
  it 'creates notification' do
    @notification_params = {
      description: 'Text',
      notify_after: Time.zone.now
    }
    expect { subject }.to change { Notification.count }.by(1)
    expect(response.status).to eq(302)
  end

  it 'does not create notification if something wrong' do
    @notification_params = {
      notify_after: Time.zone.now
    }
    expect { subject }.to raise_error(ActiveRecord::NotNullViolation)
  end
end

RSpec.shared_examples 'delete_notification' do
  it 'destroys notification' do
    expect { subject }.to change(Notification, :count).by(-1)
    expect(response.status).to eq(302)
  end

  it 'does not destroy notification if something wrong' do
    allow_any_instance_of(Notification).to receive(:destroy).and_return(false)
    expect { subject }.not_to(change(Notification, :count))
    expect(response.status).to eq(302)
  end
end
