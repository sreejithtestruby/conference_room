class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :super_manager
      can :manage, :all
    elsif user.has_role? :manager
      can :manage, :all
    elsif user.has_role? :client
      can :create
      can :update
      can :read, :all
    else
      can :read, :all
    end
  end
end
