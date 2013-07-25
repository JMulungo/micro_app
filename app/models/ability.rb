 class Ability
       include CanCan::Ability

                def initialize(user)
                  user ||= User.new # Guest
                  can :read, :all
                  if user.id
                      can :manage, Micropost, user_id: user.id
                      can :update, User, id: user.id
                  else
                      can :create, User
                  end
                end
              end
