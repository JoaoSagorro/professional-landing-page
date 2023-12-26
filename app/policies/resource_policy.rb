class ResourcePolicy < ApplicationPolicy
  attr_reader :user, :resource

  def initializer(user, resource)
    @user = user
    @resource = resource
  end
end
