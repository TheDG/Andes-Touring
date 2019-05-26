# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'create_notification_mark' do
  context 'with notification' do
    before do
      @notification_to_mark = create(:notification, notifiable: @user)
    end
    it 'mark_reads notification for user' do
      subject
      expect(@user.have_read?(@notification_to_mark)).to be true
      expect(response).to redirect_to(notifications_path)
    end
  end
end

RSpec.shared_examples 'create_notification_marks' do
  context 'with notifications' do
    before do
      @notification_to_mark = create(:notification, notifiable: @user)
      @notification_to_mark2 = create(:notification, notifiable: @user)
    end
    it 'mark_reads notification for user' do
      subject
      expect(@user.have_read?(@notification_to_mark)).to be true
      expect(@user.have_read?(@notification_to_mark2)).to be true
      expect(response).to redirect_to(notifications_path)
    end
  end
end
