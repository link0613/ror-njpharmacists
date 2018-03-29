# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Setting.find_or_create_by!({ setting_name: 'Twitter URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Facebook URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'LinkedIn URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Contact Email', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Donation URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Banner 1 Image', requires_file: true })
Setting.find_or_create_by!({ setting_name: 'Banner 1 URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Banner 2 Image', requires_file: true })
Setting.find_or_create_by!({ setting_name: 'Banner 2 URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Banner 3 Image', requires_file: true })
Setting.find_or_create_by!({ setting_name: 'Banner 3 URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Banner 4 Image', requires_file: true })
Setting.find_or_create_by!({ setting_name: 'Banner 4 URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Banner 5 Image', requires_file: true })
Setting.find_or_create_by!({ setting_name: 'Banner 5 URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Banner Ad Image', requires_file: true })
Setting.find_or_create_by!({ setting_name: 'Banner Ad URL', requires_file: false  })
Setting.find_or_create_by!({ setting_name: 'Global Footer Text', requires_file: false })
Setting.find_or_create_by!({ setting_name: 'Global Custom CSS Styling', requires_file: false })

Blog.find_or_create_by!({ id: 1, blog_title: 'News Feed' })

Blog.find_or_create_by!({ id: 2, blog_title: "President's Blog" })

User.destroy_all
User.new({email: 'info@impdigital.us', password: 'testing1', password_confirmation: 'testing1'}).save(validate: false)