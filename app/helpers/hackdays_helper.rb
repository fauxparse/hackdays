module HackdaysHelper
  def effort(hackday)
    users = hackday.goals.flat_map(&:users).uniq
    [
      users.size,
      "person".pluralize(users.size),
      "working on",
      hackday.goals.size,
      "goal".pluralize(hackday.goals.size)
    ].join(" ")
  end
end
