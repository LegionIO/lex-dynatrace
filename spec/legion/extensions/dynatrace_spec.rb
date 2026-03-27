# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Dynatrace do
  it 'has a version number' do
    expect(Legion::Extensions::Dynatrace::VERSION).not_to be_nil
  end

  it 'defines all sub-modules' do
    expect(described_class.const_defined?(:Metrics)).to be true
    expect(described_class.const_defined?(:Entities)).to be true
    expect(described_class.const_defined?(:Problems)).to be true
    expect(described_class.const_defined?(:Events)).to be true
    expect(described_class.const_defined?(:Logs)).to be true
    expect(described_class.const_defined?(:AuditLogs)).to be true
    expect(described_class.const_defined?(:ActiveGates)).to be true
    expect(described_class.const_defined?(:Extensions20)).to be true
    expect(described_class.const_defined?(:Slos)).to be true
    expect(described_class.const_defined?(:Synthetic)).to be true
    expect(described_class.const_defined?(:SecurityProblems)).to be true
    expect(described_class.const_defined?(:SettingsObjects)).to be true
    expect(described_class.const_defined?(:NetworkZones)).to be true
    expect(described_class.const_defined?(:Tags)).to be true
    expect(described_class.const_defined?(:Tokens)).to be true
    expect(described_class.const_defined?(:Releases)).to be true
  end
end
