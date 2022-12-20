class Event < ApplicationRecord
  extend FriendlyId
  validates :title, length: { in: 2..100 }
  validates :description, length: { in: 0..200 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_many :voters
  has_many :voters_with_email, -> { where.not(email: '') }, class_name: 'Voter'

  has_many :votes
  friendly_id :slug_candidates, use: :slugged

  before_validation :clean_inputs, only: %i[title description]

  def days
    arr = []
    (start_date..end_date).each.map { |day| arr << { start_date: day, end_date: day } }
    arr.map { |hsh| OpenStruct.new(hsh) }
  end

  def email_list(id)
    event = Event.find(id)
    event.voters_with_email
  end

  def majority(id)
    vote_query = Event.where(id:).joins(:votes).group('events.id').group('votes.day').count
    sorted_days = vote_query.sort_by { |_date, count| count }.reverse.to_a
    begin
      max = sorted_days.first[1]
    rescue StandardError
      sorted_days
    else
      sorted_days.select { |day| day[1] >= max }.reverse
    end
  end

  def slug_candidates
    [
      [random_prefix, :title],
      [random_monster, :title],
      %i[title end_date],
      [random_prefix, :title, :end_date],
      [random_monster, :title, :end_date]
    ]
  end

  private

  def random_monster
    monsters = %w[ aboleth yeti chicken acererak acolyte dragon ankheg assassin azer basilisk behir dog
                   bugbear centaur chuul cockatrice chimera dryad dwarf gorgon gargoyle genie ghost ghoul giant
                   gnoll gnome golem goblin ogre ooze owlbear owl orc griffon halflings harpy satyr cat bat bison boar
                   phasm hydra howler hobgoblin hippogriff homunculus howler kobold kraken lich lycanthorpe duergar
                   roc sprite lizardfolk elf]
    monsters.sample
  end

  def random_prefix
    prefixes = %w[ youre-invited-to welcome-to a-kingly-invite-to attention twitch-presents a-personal-invite-to
                   attention-adventurers my-lord-of-thicc]
    prefixes.sample
  end

  def clean_inputs
    self.title = title.delete("\000") unless title.nil?
    self.description = description.delete("\000") unless description.nil?
  end
end
