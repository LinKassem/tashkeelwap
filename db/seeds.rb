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
	p = Player.new(email: 'player1@gmail.com', password: '123456', name: 'PlayerI')
	p.save!

puts("# ----------------------- Validations ----------------------- ")
	v = Validation.new(user_digitization:'بشيء',word_image_url: "/assets/29.jpg",
			word_id:'1', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'لم',word_image_url: '/assets/30.jpg',
			word_id:'2', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'على',word_image_url: '/assets/40.jpg',
			word_id:'3', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'اجتمعوا',word_image_url: '/assets/39.jpg',
			word_id:'4', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'ولو',word_image_url: '/assets/38.jpg',
			word_id:'5', certinity_rate:'1',known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'لك',word_image_url: '/assets/37.jpg',
			word_id:'6', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'الله',word_image_url: '/assets/36.jpg',
			word_id:'7', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'كتبه',word_image_url: '/assets/35.jpg',
			word_id:'8', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'قد',word_image_url: '/assets/34.jpg',
			word_id:'9', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'بشيء',word_image_url: '/assets/33.jpg',
			word_id:'10', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'إلا',word_image_url: '/assets/32.jpg',
			word_id:'11', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'ينفعوك',word_image_url: '/assets/31.jpg',
			word_id:'12', certinity_rate:'1',known:'false')
	v.save!


puts("# ----------------------- Words ----------------------- ")

w = Word.new(ocr_digitization:'يا', word_image_url: '/assets/1.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'غلام', word_image_url: '/assets/2.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'إني', word_image_url: '/assets/3.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'أعلمك', word_image_url: '/assets/4.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'كلمات', word_image_url: '/assets/5.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'احفظ', word_image_url: '/assets/6.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/7.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'يحفظك', word_image_url: '/assets/8.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'احفظ', word_image_url: '/assets/9.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/10.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'تجده', word_image_url: '/assets/11.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'تجاهك', word_image_url: '/assets/12.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'إذا', word_image_url: '/assets/13.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'سألت', word_image_url: '/assets/14.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'فسأل', word_image_url: '/assets/15.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/16.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'وإذا', word_image_url: '/assets/17.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'استعنت', word_image_url: '/assets/18.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'فاستعن', word_image_url: '/assets/19.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'بالله', word_image_url: '/assets/20.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'واعلم', word_image_url: '/assets/21.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'أن', word_image_url: '/assets/22.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الأمة', word_image_url: '/assets/23.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'لو', word_image_url: '/assets/24.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'اجتمعت', word_image_url: '/assets/25.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'على', word_image_url: '/assets/26.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'أن', word_image_url: '/assets/27.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'ينفعوك', word_image_url: '/assets/28.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'بشيء', word_image_url: '/assets/29.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'لم', word_image_url: '/assets/30.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'ينفعوك', word_image_url: '/assets/31.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'إلا', word_image_url: '/assets/32.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'بشيء', word_image_url: '/assets/33.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'قد', word_image_url: '/assets/34.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'كتبه', word_image_url: '/assets/35.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/36.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'لك', word_image_url: '/assets/37.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'ولو', word_image_url: '/assets/38.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'اجتمعوا', word_image_url: '/assets/39.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'على', word_image_url: '/assets/40.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'أن', word_image_url: '/assets/41.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'يضروك', word_image_url: '/assets/42.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'بشيء', word_image_url: '/assets/43.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'لم', word_image_url: '/assets/44.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'يضروك', word_image_url: '/assets/45.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'إلا', word_image_url: '/assets/46.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'بشيء', word_image_url: '/assets/47.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'قد', word_image_url: '/assets/48.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'كتبه', word_image_url: '/assets/49.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/50.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'عليك', word_image_url: '/assets/51.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'رفعت', word_image_url: '/assets/52.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الأقلام', word_image_url: '/assets/53.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'وجفت', word_image_url: '/assets/54.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الصحف', word_image_url: '/assets/55.jpg', display_repetitions: '3')
w.save!
