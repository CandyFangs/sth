class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_items.subject_item_notes
    if notes.length == 0
      0.0
    else
      (notes.sum / notes.length).to_s.round(2).rjust(2, '0')
    end
  end
end
