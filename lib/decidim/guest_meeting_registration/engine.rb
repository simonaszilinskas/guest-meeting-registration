# frozen_string_literal: true

require "rails"
require "deface"
require "decidim/core"

module Decidim
  module GuestMeetingRegistration
    # This is the engine that runs on the public interface of guest_meeting_registration.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::GuestMeetingRegistration

      routes do
        # Add engine routes here
        # resources :guest_meeting_registration
        # root to: "guest_meeting_registration#index"
      end

      initializer "decidim_guest_meeting_registration.views" do
        Rails.application.configure do
          config.deface.enabled = Decidim::GuestMeetingRegistration.deface_enabled
        end
      end

      initializer "decidim_guest_meeting_registration.add_cells_view_paths" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::GuestMeetingRegistration::Engine.root}/app/cells")
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::GuestMeetingRegistration::Engine.root}/app/views") # for partials
      end

      initializer "decidim_guest_meeting_registration.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
