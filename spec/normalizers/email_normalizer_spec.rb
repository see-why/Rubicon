# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmailNormalizer do
  it 'normalizes email' do
    expect(EmailNormalizer.call(" MYGARRI@GMAIL.COM \n")).to eq('mygarri@gmail.com')
  end
end
