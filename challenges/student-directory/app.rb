require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'

class Application
  def initialize(database_name)
    DatabaseConnection.connect(database_name)
    @cohort = CohortRepository.new
  end

  def lookup_cohort(id)
    result_set = @cohort.find_with_students(id)
    puts "Name of cohort: #{result_set.name}"
    puts "Start date: #{result_set.start_date}" 
    puts "Number of students in cohort: #{result_set.students.length}" 
    puts "Students in the cohort:"
    result_set.students.each do |student|
      puts "- #{student.name}"
   end
  end

end

if __FILE__ == $0
  app = Application.new(
    'student_directory_2'
  )
  app.lookup_cohort('1')
end