class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    sum = 0.0
    notes = subject_item.subject_item_notes.pluck(:value)
    if notes.length == 0
      '0.00'
    else
      notes.each do |note|
        sum += note
      end
      (sum / notes.length).round(2).to_s.ljust(4, '0')
    end
  end
end
