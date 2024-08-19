# frozen_string_literal: true

module Decidim
  module GuestMeetingRegistration
    # This is the engine that runs on the public interface of `GuestMeetingRegistration`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::GuestMeetingRegistration::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :guest_meeting_registration do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "guest_meeting_registration#index"
      end

      def load_seed
        nil
      end
    end
  end
end
