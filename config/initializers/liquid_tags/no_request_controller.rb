class NoRequestController < ActionController::Metal
	abstract!

	ActionController::Base.without_modules(:StrongParameters).each do |left|
	  include left
	end
end