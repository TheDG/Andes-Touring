# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'create_comment' do
  it 'creates comment' do
    @comment_params = {
      content: 'Text'
    }
    expect { subject }.to change(Comment, :count).by(1)
    comment = assigns(:comment)
    expect(JSON.parse(response.body)).to eq(
      'comment' => {
        'content' => 'Text', 'url' => "/comments/#{comment.id}",
        'created_at' => comment.readable_date_with_time(:created_at),
        'commentator' => {
          'email' => comment.commentator.email.truncate(22)
        }
      }
    )
  end

  it 'responds 422 if cant create' do
    @comment_params = { quote_id: @quote.id }
    expect { subject }.not_to(change(Comment, :count))
    expect(response.status).to eq(422)
  end
end

RSpec.shared_examples 'delete_comment' do
  it 'destroys comment' do
    expect { subject }.to change(Comment, :count).by(-1)
  end

  it 'does not destroy comment if something wrong' do
    allow_any_instance_of(Comment).to receive(:destroy).and_return(false)
    expect { subject }.not_to(change(Comment, :count))
    expect(response.status).to eq(422)
  end
end
