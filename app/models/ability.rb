class Ability
  include CanCan::Ability

  def initialize( user )
    user ||= User.new

    # Define User abilities
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
    end
  end
end
