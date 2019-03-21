require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

house1 = House.new({
  'name' => 'Gryffindor',
  'crest' => 'https://cdn2.bigcommerce.com/n-biq04i/xd4xhbm/products/7053/images/2825/12Gryffindor__07292.1490131688.1280.1280.jpg?c=2'

  })



house2 = House.new({
  'name' => 'Slytherin',
  'crest' => 'https://cdn.shopify.com/s/files/1/2393/5817/products/Harry-Potter-Slytherin-Crest-Boys-T-Shirt-Logo-Web_1400x.jpg?v=1549880722'

  })



house3 = House.new({
  'name' => 'Hufflepuff',
  'crest' => 'http://cdn.shopify.com/s/files/1/2597/5112/products/hptvthufy_1_1200x1200.jpg?v=1517443081'

  })




  house4 = House.new({
    'name' => 'Ravenclaw',
    'crest' => 'http://cdn.shopify.com/s/files/1/2597/5112/products/hptvtravat_1_88e78167-7950-4440-beb8-35fa9dd3564d_1200x1200.jpg?v=1517443253'

    })

    house1.save
    house2.save
    house3.save
    house4.save

    student1 = Student.new({
      'first_name' => 'Harry',
      'last_name' => 'Potter',
      'house' => house1.id,
      'age' => 13
      })



    student2 = Student.new({
      'first_name' => 'Draco',
      'last_name' => 'Malfoy',
      'house' => house2.id,
      'age' => 13
      })



    student3 = Student.new({
        'first_name' => 'Belinda',
        'last_name' => 'Hoggleswitch',
        'house' => house3.id,
        'age' => 13
        })



    student4 = Student.new({
        'first_name' => 'Carlos',
        'last_name' => 'Thunderstomp',
        'house' => house4.id,
        'age' => 13
        })


student1.save
student2.save
student3.save
student4.save




#
# student4.find_students_house
# binding.pry
# nil
