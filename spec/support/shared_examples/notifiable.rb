# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'index_notifications' do
  context 'with 1 notification' do
    before do
      @notification = create(:notification, notifiable: @user)
    end
    context 'unread by user' do
      context 'with past notification' do
        it 'should responds ok and assign notifications' do
          subject
          expect(assigns(:notifications)).to match_array(Notification.all)
          expect(response).to render_template(:index)
          expect(response.status).to eq(200)
        end
      end

      context 'with future notification' do
        before do
          @notification.update(notify_after: Time.zone.tomorrow)
        end
        it 'should responds ok and assign notifications' do
          subject
          expect(assigns(:notifications)).to match_array([])
          expect(response).to render_template(:index)
          expect(response.status).to eq(200)
        end
      end
    end

    context 'read by user' do
      before do
        @notification.mark_as_read! for: @user
      end
      context 'with past notification' do
        it 'should responds ok and assign notifications' do
          subject
          expect(assigns(:notifications)).to match_array([])
          expect(response).to render_template(:index)
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
