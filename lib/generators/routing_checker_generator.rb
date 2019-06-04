# frozen_string_literal: true

class RoutingCheckerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  # @raise no_method_error if name not exist in class private method
  def perform
    send(:"#{name}")
  end

  private

  def create
    template file_name, file_path
  end

  # @return [String]
  def base_name
    'routing_checker'
  end

  # @return [String]
  def file_name
    [
      base_name,
      'rb'
    ].join('.')
  end

  # @return [Pathname]
  def file_path
    Rails.root.join('config').join('initializers').join(file_name)
  end
end
