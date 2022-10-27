require 'cohort_repository'

def reset_cohorts_table
  seed_sql = File.read('spec/seeds_cohorts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
  connection.exec(seed_sql)
end

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
  connection.exec(seed_sql)
end

describe CohortRepository do
  before(:each) do 
    reset_students_table
  end

  it 'finds cohort 1 with related students' do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)
    expect(cohort.name).to eq 'Eagles'
    expect(cohort.students.length).to eq 2
    expect(cohort.students[0].name).to eq 'Clive'
    expect(cohort.students[1].id).to eq '2'
  end


end
