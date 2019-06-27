class EventPolicy < ApplicationPolicy
	def index?
		true
	end
	def show?
		true
	end
 
	def create?
		user.present?
	end
 
	def update?
		if user.present? && user == article.user then
			return true
		elsif user.try(:admin?) then
			return true
		end
	end
 
	def destroy?
		if user.present? && user == article.user then
			return true
		elsif user.try(:admin?) then
			return true
		end
	end
 
	private
 
	def article
		record
	end
end
