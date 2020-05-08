class Course < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment
        
    belongs_to :prerequisite,
        class_name: :Course,
        primary_key: :id,
        foreign_key: :prereq_id,
        optional: true
        
    belongs_to(:instructor,
        { class_name: :User,
        primary_key: :id,
        foreign_key: :instructor_id })
    
    has_many :enrolled_students,
        through: :enrollments,
        source: :user
end
