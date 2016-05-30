class Feedback < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  validate :name_check, :age_check, :date_check

  private
  def name_check
    words = name.split(' ')
    capitalized_words = false
    words.each do |word|
      if word =~ /^[A-ZА-Я'][a-zа-я-' ]+[a-zа-я']?$/u
        capitalized_words = true
      else
        capitalized_words = false
      end
    end
    if words.length != 2 || !capitalized_words
      errors.add(:name, 'should contain two capitalized words')
    end
  end

  def age_check
    unless birthday <= 17.years.ago && birthday >= 65.years.ago
      errors.add(:birthday, 'should be placed in diapazon 17..65 years')
    end
  end

  def date_check
    unless date > Time.zone.now
      errors.add(:date, 'should be in future')
    end
  end
end
