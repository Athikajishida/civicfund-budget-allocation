Admin.find_or_create_by!(email: "admin@admin.com") do |admin|
  admin.password = "admin123"
  admin.password_confirmation = "admin123"
end
