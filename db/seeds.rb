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
	p = Player.new(email: 'Joudi@gmail.com', password: '123456', name: 'Joudi')
	p.save!

puts("# ----------------------- Validations ----------------------- ")
	v = Validation.new(user_digitization:'احفظ',word_image_url: "/assets/6.jpg",
			word_id:'1', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'وإذا',word_image_url: '/assets/17.jpg',
			word_id:'7', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'أن',word_image_url: '/assets/27.jpg',
			word_id:'12', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'ينفعوك',word_image_url: '/assets/28.jpg',
			word_id:'13', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'يضروك',word_image_url: '/assets/45.jpg',
			word_id:'17', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'تجده',word_image_url: '/assets/11.jpg',
			word_id:'21', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'إلا',word_image_url: '/assets/32.jpg',
			word_id:'27', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'لك',word_image_url: '/assets/37.jpg',
			word_id:'32', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'بشيء',word_image_url: '/assets/43.jpg',
			word_id:'38', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'الأقلام',word_image_url: '/assets/53.jpg',
			word_id:'43', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'إني',word_image_url: '/assets/3.jpg',
			word_id:'48', certinity_rate:'1',known:'false')
	v.save!

	v = Validation.new(user_digitization:'الأمة',word_image_url: '/assets/23.jpg',
			word_id:'53', certinity_rate:'1',known:'false')
	v.save!
#########################  NEW validations #############################
	v = Validation.new(user_digitization:'مَرَرْنا', word_image_url: "/assets/100.PNG", word_id: '100', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'فرَدَّنا', word_image_url: "/assets/101.PNG", word_id: '101', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'عَنِ', word_image_url: "/assets/102.PNG", word_id: '102', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'فَقُلْتُ', word_image_url: "/assets/103.PNG", word_id: '103', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'نِعْمَة', word_image_url: "/assets/104.PNG", word_id: '104', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تزورها', word_image_url: "/assets/105.PNG", word_id: '105', certinity_rate:'1', known:'false')
	v.save!
	################################
	v = Validation.new(user_digitization:'كُلَّ', word_image_url: "/assets/106.PNG", word_id: '106', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'احتِمالَهُ', word_image_url: "/assets/107.PNG", word_id: '107', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الزنجُ', word_image_url: "/assets/108.PNG", word_id: '108', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'بَدَتْ', word_image_url: "/assets/109.PNG", word_id: '109', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'جانب', word_image_url: "/assets/110.PNG", word_id: '110', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'الدَّرْبِ', word_image_url: "/assets/111.PNG", word_id: '111', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تَلْقَى', word_image_url: "/assets/112.PNG", word_id: '112', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'حَبيبَها', word_image_url: "/assets/113.PNG", word_id: '113', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تُسَرُّ', word_image_url: "/assets/114.PNG", word_id: '114', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'كُلُّ', word_image_url: "/assets/115.PNG", word_id: '115', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'الغِيابِ', word_image_url: "/assets/116.PNG", word_id: '116', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'يُضِيرُها', word_image_url: "/assets/117.PNG", word_id: '117', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'سرَّها', word_image_url: "/assets/118.PNG", word_id: '118', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الفِراقِ', word_image_url: "/assets/119.PNG", word_id: '119', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'لقاؤه', word_image_url: "/assets/120.PNG", word_id: '120', certinity_rate:'1', known:'false')
	v.save!
	###################################
	v = Validation.new(user_digitization:'سرُورُها', word_image_url: "/assets/121.PNG", word_id: '121', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تُبْصِرِ', word_image_url: "/assets/122.PNG", word_id: '122', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مَرَّةً', word_image_url: "/assets/123.PNG", word_id: '123', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'العَيْنُ', word_image_url: "/assets/124.PNG", word_id: '124', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'العَيْنُ', word_image_url: "/assets/125.PNG", word_id: '125', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'بائعُ', word_image_url: "/assets/126.PNG", word_id: '126', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'برمٌ', word_image_url: "/assets/127.PNG", word_id: '127', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مَنْهاتِنَ', word_image_url: "/assets/128.PNG", word_id: '128', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'يفقه', word_image_url: "/assets/129.PNG", word_id: '129', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'البولون', word_image_url: "/assets/130.PNG", word_id: '130', certinity_rate:'1', known:'false')
	v.save!
	###########################
	v = Validation.new(user_digitization:'يُغْلِقُ', word_image_url: "/assets/131.PNG", word_id: '131', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'شَرَعاً', word_image_url: "/assets/132.PNG", word_id: '132', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'رشَّاشٌ', word_image_url: "/assets/133.PNG", word_id: '133', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'قُبَّعة', word_image_url: "/assets/134.PNG", word_id: '134', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تحيي', word_image_url: "/assets/135.PNG", word_id: '135', certinity_rate:'1', known:'false')
	v.save!
	################################
	v = Validation.new(user_digitization:'شُقْرٌ', word_image_url: "/assets/136.PNG", word_id: '136', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'يَرَوْنَ', word_image_url: "/assets/137.PNG", word_id: '137', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تَراهُم', word_image_url: "/assets/138.PNG", word_id: '138', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مَهْلاً', word_image_url: "/assets/139.PNG", word_id: '139', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'صَوَراٌ', word_image_url: "/assets/140.PNG", word_id: '140', certinity_rate:'1', known:'false')
	v.save!
	#############################

	v = Validation.new(user_digitization:'امْرَأَةٍ', word_image_url: "/assets/141.PNG", word_id: '141', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الفِجْلَ', word_image_url: "/assets/142.PNG", word_id: '142', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'طُولَ', word_image_url: "/assets/143.PNG", word_id: '143', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'اليَومْ', word_image_url: "/assets/144.PNG", word_id: '144', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'أَسْوَارٌ', word_image_url: "/assets/145.PNG", word_id: '145', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'مِنَ', word_image_url: "/assets/146.PNG", word_id: '146', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مِتْراسٌ', word_image_url: "/assets/147.PNG", word_id: '147', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الأسْمَنْتْ', word_image_url: "/assets/148.PNG", word_id: '148', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'دَبَّ', word_image_url: "/assets/149.PNG", word_id: '149', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'منتَعَلَلِينٌ', word_image_url: "/assets/150.PNG", word_id: '150', certinity_rate:'1', known:'false')
	v.save!
	##################################
	v = Validation.new(user_digitization:'صَلَّينا', word_image_url: "/assets/151.PNG", word_id: '151', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الأَسفَلْتْ', word_image_url: "/assets/152.PNG", word_id: '152', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'أنْتْ', word_image_url: "/assets/153.PNG", word_id: '153', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مُتَبسما', word_image_url: "/assets/154.PNG", word_id: '154', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'أُمَّةٌ', word_image_url: "/assets/155.PNG", word_id: '155', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'وَتَلَفَّتَ', word_image_url: "/assets/156.PNG", word_id: '156', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'أَظَنَنْتَ', word_image_url: "/assets/157.PNG", word_id: '157', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'أمامَكَ', word_image_url: "/assets/158.PNG", word_id: '158', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مَتْنُ', word_image_url: "/assets/159.PNG", word_id: '159', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'وهامشٍ', word_image_url: "/assets/160.PNG", word_id: '160', certinity_rate:'1', known:'false')
	v.save!
	###############################
	v = Validation.new(user_digitization:'سَتُزيحُ', word_image_url: "/assets/161.PNG", word_id: '161', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'واقِعِها', word_image_url: "/assets/162.PNG", word_id: '162', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'هَواكْ', word_image_url: "/assets/163.PNG", word_id: '163', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الغزالةُ', word_image_url: "/assets/164.PNG", word_id: '164', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'حَكَمَ', word_image_url: "/assets/165.PNG", word_id: '165', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'بِبَيْنِها', word_image_url: "/assets/166.PNG", word_id: '166', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تَرْكُضُ', word_image_url: "/assets/167.PNG", word_id: '167', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'وَدَّعَتْكَ', word_image_url: "/assets/168.PNG", word_id: '168', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'بِعَينِها', word_image_url: "/assets/169.PNG", word_id: '168', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'رفقاً', word_image_url: "/assets/170.PNG", word_id: '170', certinity_rate:'1', known:'false')
	v.save!
	###########################
	v = Validation.new(user_digitization:'بِنِفسِكَ', word_image_url: "/assets/171.PNG", word_id: '171', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'وَهَنْتْ', word_image_url: "/assets/172.PNG", word_id: '172', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الثرى', word_image_url: "/assets/173.PNG", word_id: '173', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'دهرُها', word_image_url: "/assets/174.PNG", word_id: '174', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'أجنبيٌ', word_image_url: "/assets/175.PNG", word_id: '175', certinity_rate:'1', known:'false')
	v.save!
	###########################
	v = Validation.new(user_digitization:'دهر', word_image_url: "/assets/176.PNG", word_id: '176', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'حُدُباً', word_image_url: "/assets/177.PNG", word_id: '177', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تَطَوَّرَتْ', word_image_url: "/assets/178.PNG", word_id: '178', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'فوقه', word_image_url: "/assets/179.PNG", word_id: '179', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تدللها', word_image_url: "/assets/180.PNG", word_id: '180', certinity_rate:'1', known:'false')
	v.save!
	###########################
	v = Validation.new(user_digitization:'وَتُدْنِيها', word_image_url: "/assets/181.PNG", word_id: '181', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تُوَزِّعُها', word_image_url: "/assets/182.PNG", word_id: '182', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'يرتاحُ', word_image_url: "/assets/183.PNG", word_id: '183', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'التناقضُ', word_image_url: "/assets/184.PNG", word_id: '184', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'العِباد', word_image_url: "/assets/185.PNG", word_id: '185', certinity_rate:'1', known:'false')
	v.save!
	############################
	v = Validation.new(user_digitization:'يُقَلِّبُونَ', word_image_url: "/assets/186.PNG", word_id: '186', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'قَدِيمها', word_image_url: "/assets/187.PNG", word_id: '187', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'وَجَدِيدَها', word_image_url: "/assets/188.PNG", word_id: '188', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تُلْمَسُ', word_image_url: "/assets/189.PNG", word_id: '189', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'باليدينَ', word_image_url: "/assets/190.PNG", word_id: '190', certinity_rate:'1', known:'false')
	v.save!
	###########################
	v = Validation.new(user_digitization:'كَفَّيكَ', word_image_url: "/assets/191.PNG", word_id: '191', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'نَصَّ', word_image_url: "/assets/192.PNG", word_id: '192', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'قصيدَةٍ', word_image_url: "/assets/193.PNG", word_id: '193', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'اثْنَتَيْنْ', word_image_url: "/assets/194.PNG", word_id: '194', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'النَّكَباتِ', word_image_url: "/assets/195.PNG", word_id: '195', certinity_rate:'1', known:'false')
	v.save!
	####################################
	v = Validation.new(user_digitization:'طُفُولَةٍ', word_image_url: "/assets/196.PNG", word_id: '196', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'يَطِيرُ', word_image_url: "/assets/197.PNG", word_id: '197', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'يُعلِنُ', word_image_url: "/assets/198.PNG", word_id: '198', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'دَوْلَةً', word_image_url: "/assets/199.PNG", word_id: '199', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'بين', word_image_url: "/assets/200.PNG", word_id: '200', certinity_rate:'1', known:'false')
	v.save!
	#################################
	v = Validation.new(user_digitization:'رُصاصُتين', word_image_url: "/assets/201.PNG", word_id: '201', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تنظيمُ', word_image_url: "/assets/202.PNG", word_id: '202', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'كأنهنَّ', word_image_url: "/assets/203.PNG", word_id: '203', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'سطورُ', word_image_url: "/assets/204.PNG", word_id: '204', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تاريخِ', word_image_url: "/assets/205.PNG", word_id: '205', certinity_rate:'1', known:'false')
	v.save!
	##################################
	v = Validation.new(user_digitization:'المدينةِ', word_image_url: "/assets/206.PNG", word_id: '206', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الكتابُ', word_image_url: "/assets/207.PNG", word_id: '207', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'ترابُها', word_image_url: "/assets/208.PNG", word_id: '208', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'مرُّوا', word_image_url: "/assets/209.PNG", word_id: '209', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'تقبلَ', word_image_url: "/assets/210.PNG", word_id: '210', certinity_rate:'1', known:'false')
	v.save!
	###################################
	v = Validation.new(user_digitization:'القِفْجَاقُ', word_image_url: "/assets/211.PNG", word_id: '211', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'الصقلاب', word_image_url: "/assets/212.PNG", word_id: '212', certinity_rate:'1', known:'false')
	v.save!
	
	v = Validation.new(user_digitization:'البُشْنَاقُ', word_image_url: "/assets/213.PNG", word_id: '213', certinity_rate:'1', known:'false')
	v.save!

puts("# ----------------------- Words ----------------------- ")

w = Word.new(ocr_digitization:'احفظ', word_image_url: '/assets/6.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/7.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'يحفظك', word_image_url: '/assets/8.jpg', display_repetitions: '3')
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

w = Word.new(ocr_digitization:'احفظ', word_image_url: '/assets/9.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'يضروك', word_image_url: '/assets/45.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'إلا', word_image_url: '/assets/46.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'بشيء', word_image_url: '/assets/47.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'الله', word_image_url: '/assets/10.jpg', display_repetitions: '3')
w.save!

w = Word.new(ocr_digitization:'قد', word_image_url: '/assets/48.jpg', display_repetitions: '3')
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

w = Word.new(ocr_digitization:'لم', word_image_url: '/assets/44.jpg', display_repetitions: '3')
w.save!
