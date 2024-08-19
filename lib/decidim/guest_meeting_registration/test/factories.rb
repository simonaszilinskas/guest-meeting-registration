# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :guest_meeting_registration_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :guest_meeting_registration).i18n_name }
    manifest_name :guest_meeting_registration
    participatory_space { create(:participatory_process, :with_steps) }
  end

  # Add engine factories here
end
