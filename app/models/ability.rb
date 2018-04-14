class Ability
  include CanCan::Ability
  include ActiveAdminRole::CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    if user.super_user?
      can :manage, :all
    elsif user.seller_user?
      can :manage, Store, :admin_user_id => user.id
      can :manage, AdminUser
      cannot [:destroy, :create], Store
    end

    # NOTE: Everyone can read the page of Permission Deny
    can :read, ActiveAdmin::Page, name: "Dashboard"
  end
end
