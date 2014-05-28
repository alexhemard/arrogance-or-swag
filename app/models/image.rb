class Image < ActiveRecord::Base
  has_attached_file    :image

  validates_attachment :image, presence:     true,
                               size:         { in: 0..4.megabytes }

  validates_attachment_content_type :image,
  :content_type => /\Aimage\/.*\Z/

  def arrogant_or_swag?
    if vote_arrogance == vote_swag
      :both
    elsif vote_arrogance > vote_swag
      :arrogant
    else
      :swag
    end
  end

  def vote_arrogance! amount
    vote :arrogance, amount
  end

  def vote_swag! amount
    vote :swag, amount
  end

  def self.reset_all!
    self.connection.execute <<End
   update images set vote_arrogance=0, vote_swag=0
End
  end

  private

  def vote type, amount
    return unless [:arrogance, :swag].include? type

    type   = "vote_#{type}"

    amount = amount.to_i
    amount = [1, amount].max
    amount = [amount, 4].min

    Image.connection.execute "update images set \"#{type}\" = COALESCE(\"#{type}\", 0) + #{amount}, \"vote_count\" = COALESCE(\"vote_count\", 0) + 1 where \"images\".\"id\" = #{self.id}"
    self.reload
  end
end
