class Ability
  include CanCan::Ability
  include ActiveAdminRole::CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    if user.super_user?
      can :manage, :all
    elsif user.seller_user?
      can :manage, Store
      can :manage, AdminUser
    end

    # NOTE: Everyone can read the page of Permission Deny
    can :read, ActiveAdmin::Page, name: "Dashboard"
  end
end
