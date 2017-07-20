puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
first_name = %w(Fred Cut-Me-Own-Heart Rufus Cheery Carrot Nobby Sybil Reg Havelock Sam Mustrum Ponder Magrat Agnes Gytha Eskarina Esmeralda Susan Otto Moist Adora-Belle Rosemary Cohen Jeremy Lobsang Jonathan Tiffany Lady)
last_name = %w(Colon Dibbler Drumknott Littlebottom Ironfoundersson Nobbs Ramkin Shoe Vetinari Vimes Ridcully Stibbons Garlick Nitt Ogg Smith Weatherwax Sto-Helit Chriek von-Lipvig Dearheart Palm the-Barbarian Clockson Ludd Teatime Aching Margolotta)
subjects_titles = %w(Math English Physics Chemistry Biology )
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: first_name.sample,
    last_name: last_name.sample,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: subjects_titles.sample,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: first_name.sample,
    last_name: last_name.sample,
    birthdate: Date.today - rand(365*19..365*30)
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
