module ApplicationHelper

  def last_vote image
    case session[:last_viewed_vote]
    when "a"
      "Arrogant"
    when "s"
      "Swag"
    end
  end

  def compute_arrogance_or_swag image
    arrogance = image.vote_arrogance || 0
    swag      = image.vote_swag      || 0
    total     = arrogance + swag

    if arrogance > swag
      "Arrogant (#{arrogance.fdiv(total) * 100}%)"
    elsif swag > arrogance
      "Swag (#{swag.fdiv(total) * 100}%)"
    else
      "Undecided..."
    end
  end

  def arrogance_percent image
    total_arrogance = image.vote_arrogance_count.fdiv(image.vote_count)
    ((image.arrogance / 4.0) * 100) * total_arrogance
  end

  def swag_percent image
    total_swag = image.vote_swag_count.fdiv(image.vote_count)
    ((image.swag / 4.0) * 100) * total_swag
  end
end
