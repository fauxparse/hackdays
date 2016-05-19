module TenseHelper
  def tense(object, key, *args)
    tense = object.future? ? :future : object.past? ? :past? : :present
    t("#{key}.#{tense}", *args)
  end
end
