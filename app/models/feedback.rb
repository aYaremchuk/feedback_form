class Feedback < ActiveRecord::Base
  extend TimeSplitter::Accessors
  validate :age_check, :name_check, :date_check
  mount_uploader :attachment, AttachmentUploader
  split_accessor :date

  private

  def name_check
    words = name.split(' ')
    capitalized_words = false
    words.each do |word|
      capitalized_words = word =~ /^[A-ZА-Я'][a-zа-я\-' ]+[a-zа-я']?$/u ? true : false
    end
    errors.add(:name, 'should contain two capitalized words') if words.length != 2 || !capitalized_words
  end

  def age_check
    return if birthday.present? && birthday <= 17.years.ago && birthday >= 65.years.ago
    errors.add(:birthday, 'your age should be between 17..65 years')
  end

  def date_check
    return if date.present? && date > Time.zone.now
    errors.add(:date, 'should be in future')
  end
end
