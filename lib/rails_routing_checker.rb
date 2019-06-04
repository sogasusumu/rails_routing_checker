# frozen_string_literal: true

require 'rails_routing_checker/railtie'

module RailsRoutingChecker
  class Error < StandardError; end

  module Extender
    refine Array do
      def deep_freeze
        map(&:freeze).freeze
      end

      # @return [Array<String>]
      def with_actions
        map(&:with_action)
      end
    end

    refine Hash do
      def deep_freeze
        map(&:freeze).to_h.freeze
      end

      # @return [String]
      def with_action
        [
          self[:controller],
          self[:action]
        ].join('#')
      end
    end

    refine String do
      # @return [Bool]
      def allow?
        %i[index show create update delete].include?(self)
      end
    end
  end

  using RailsRoutingChecker::Extender

  class << self
    def valid!(attr = controller_with_actions, arr = allow_actions)
      forbid_action_hsh(attr, arr).with_actions.tap do |strings|
        raise Error, strings.to_s if strings.present?
      end
    end

    private

    # @param attr [Hash]
    # @param arr [Array<String>]
    # @return [Array<Hash>]
    def forbid_action_hsh(attr = controller_with_actions, arr = allow_actions)
      attr.reject { |hsh| arr.include?(hsh[:action]) }
    end

    def controller_with_actions
      RailsInspector.controller_with_actions.deep_freeze
    end

    def allow_actions
      %w[index show create update delete]
    end
  end
end
