class LessonsController < ApplicationController
	before_action :require_enrollment_for_current_user, only: [:show]

	def show

	end

	private
	
	def require_enrollment_for_current_user
		 if current_user.enrolled_in?(current_lesson.section.course) == false
      redirect_to course_path(current_lesson.section.course), alert: 'Must be enrolled to view lessons'
    end
	end 

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
end
