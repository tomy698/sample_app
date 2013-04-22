# encoding: utf-8

module ApplicationHelper
  def titre
    base_titre = I18n.t("fields.title")
    if @titre.nil?
      base_titre
    else
      "#{base_titre} | #{@titre}"
    end
  end

  def logo
    logo = image_tag("logo.png", :alt => I18n.t("fields.title"), :class => "round")
  end

  def deleteIcon
    deleteIcon = image_tag("deleteIcon.png", :alt => I18n.t("buttons.delete"), :title => I18n.t("buttons.delete"))
  end

  def flagFR
    flagFR = image_tag("fr_flag.png", :alt => "flagFR", :title => I18n.t("language.french"))
  end

  def flagEN
    flagEN = image_tag("en_flag.png", :alt => "flagEN", :title => I18n.t("language.english"))
  end
end