require 'rails_helper'

RSpec.describe 'field_with_errors initializer' do
  it 'returns the HTML tag as safe HTML without modification' do
    # Create a sample HTML tag that would normally get error styling
    html_tag = '<input type="text" class="form-control" name="user[email]">'

    # Call the proc with the HTML tag and a mock instance
    result = ActionView::Base.field_error_proc.call(html_tag, double)

    # Verify the result is the same as the input and marked as html_safe
    expect(result).to eq(html_tag)
    expect(result).to be_html_safe
  end

  it 'handles different types of HTML tags' do
    tags = [
      '<input type="text" name="user[name]">',
      '<textarea name="user[description]"></textarea>',
      '<select name="user[role]"><option>Admin</option></select>'
    ]

    tags.each do |tag|
      result = ActionView::Base.field_error_proc.call(tag, double)
      expect(result).to eq(tag)
      expect(result).to be_html_safe
    end
  end

  it 'preserves HTML attributes' do
    html_tag = '<input type="email" class="form-control" data-test="value" name="user[email]">'

    result = ActionView::Base.field_error_proc.call(html_tag, double)

    expect(result).to include('type="email"')
    expect(result).to include('class="form-control"')
    expect(result).to include('data-test="value"')
    expect(result).to include('name="user[email]"')
  end
end
