# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
     
    if user.present?
      can :update, User, id: user.id 
      can :edit, User, id: user.id
    end
        user ||= User.new # guest user (not logged in)
         if user.is_admin?
           can :crud, :all
      #   else
      #     can :read, :all
         end
    alias_action :create, :read, :update, :destroy, to: :crud
    
  end
end
