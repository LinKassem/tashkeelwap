# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts("**************************************************************")
puts("                      Creating records                    ")
puts("**************************************************************")

puts("# ----------------------- Players ----------------------- ")
	p = Player.new(email: 'player1@gmail.com', password: 'min.tra.90A', name: 'PlayerI')
	p.save!

puts("# ----------------------- Validations ----------------------- ")
	v = Validation.new(user_digitization:'بشيء',word_image_url: '29.jpg',
			word_id:'1', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'لم',word_image_url: '30.jpg',
			word_id:'2', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'على',word_image_url: '40.jpg',
			word_id:'3', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'اجتمعوا',word_image_url: '39.jpg',
			word_id:'4', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'ولو',word_image_url: '38.jpg',
			word_id:'5', certinity_rate:'1',known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'لك',word_image_url: '37.jpg',
			word_id:'6', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'الله',word_image_url: 'assets/36.jpg',
			word_id:'7', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'كتبه',word_image_url: 'assets/35.jpg',
			word_id:'8', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'قد',word_image_url: 'assets/34.jpg',
			word_id:'9', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'بشيء',word_image_url: 'assets/33.jpg',
			word_id:'10', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'إلا',word_image_url: 'assets/32.jpg',
			word_id:'11', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'ينفعوك',word_image_url: 'assets/31.jpg',
			word_id:'12', certinity_rate:'1',known:'false')
	v.save!


puts("# ----------------------- Words ----------------------- ")

	w = Word.new(ocr_digitization:'عليك', word_image_url: '/assets/51.jpg')
	w.save!

	w = Word.new(ocr_digitization:'رفعت', word_image_url: '/assets/52.jpg')
	w.save!

	w = Word.new(ocr_digitization:'الأقلام', word_image_url: '/assets/53.jpg')
	w.save!

	w = Word.new(ocr_digitization:'وجفت', word_image_url: '/assets/54.jpg')
	w.save!
