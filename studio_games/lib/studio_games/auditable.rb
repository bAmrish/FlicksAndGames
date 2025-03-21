module Auditable
  def audit(number, emoji="📝")
    puts "Audit(#{emoji}): #{number}"
  end
end