require 'faker'
require "open-uri"

puts "Destroying previous data..."

Message.destroy_all
Chatroom.destroy_all
Flashcard.destroy_all
Review.destroy_all
Rental.destroy_all
Slot.destroy_all
User.destroy_all
Agency.destroy_all
Category.destroy_all
Offer.destroy_all

puts "Data destroyed, start seeding ..."

#Seed of agency
agency1 = Agency.new({
  name: "Paris agency"
})
agency1.save!

agency2 = Agency.new({
  name: "Outdoor Trip"
})
agency2.save!

agency3 = Agency.new({
  name: "Evaneos"
})
agency3.save!

agency4 = Agency.new({
  name: "Tahiti Experiences"
})
agency4.save!

agency5 = Agency.new({
  name: "World Travelers Agency"
})
agency5.save!

agency6 = Agency.new({
  name: "Luxurious Trips"
})
agency6.save!


#Seed of users
raph = User.new({
  first_name: "Raphaël",
  last_name: "Grelon",
  email: "raph@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
raph.agency = agency1
file = URI.open("https://avatars.githubusercontent.com/u/88970113?v=4")
raph.photo.attach(io: file, filename: "#{raph.last_name}-1")
raph.save!


nico = User.new({
  first_name: "Nicolas",
  last_name: "Delfour",
  email: "nico@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})


nico.agency = agency2
file = URI.open("https://avatars.githubusercontent.com/u/7106777?v=4")
nico.photo.attach(io: file, filename: "#{nico.last_name}-1")
nico.save!


julien = User.new({
  first_name: "Julien",
  last_name: "Kiang",
  email: "julien@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
julien.agency = agency3
file = URI.open("https://avatars.githubusercontent.com/u/97103056?v=4")
julien.photo.attach(io: file, filename: "#{julien.last_name}-1")
julien.save!


antho = User.new({
  first_name: "Anthony",
  last_name: "Jacquemin",
  email: "antho@gmail.com",
  is_guide: false,
  password: "PASSWORD",
  password_confirmation: "PASSWORD"
})
antho.agency = agency4
file = URI.open("https://avatars.githubusercontent.com/u/96418474?v=4")
antho.photo.attach(io: file, filename: "#{antho.last_name}-1")
antho.save!


agents = [raph, nico, antho, julien]

fake_users = [raph, antho, julien]

url1 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1539711591/f534ccgpn41ldspdnpjf.jpg"
url2 = "https://avatars.githubusercontent.com/u/8135012?v=4"
url3 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1585588520/j0m6tlufeayghsj1uqdv.jpg"
url4 = "https://avatars.githubusercontent.com/u/43373459?v=4"
url5 = "https://avatars.githubusercontent.com/u/67561419?v=4"
url6 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641761662/hh58c3zauyocldxakd32.jpg"
url7 = "https://avatars.githubusercontent.com/u/39793588?v=4"
url8 = "https://avatars.githubusercontent.com/u/96469106?v=4"
url9 = "https://avatars.githubusercontent.com/u/65026732?v=4"
url10 = "https://avatars.githubusercontent.com/u/96442481?v=4"
url11 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641772302/dtm2zg3o6scbtsxinmkb.jpg"
url12 = "https://avatars.githubusercontent.com/u/86692082?v=4"
url13 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641812431/p0bndradvq1oioufn2mx.jpg"
url14 = "https://avatars.githubusercontent.com/u/96295313?v=4"
url15 = "https://avatars.githubusercontent.com/u/89845255?v=4"
url16 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641934018/ht03mphxzhpaui3w0ebr.jpg"


photos_url = [url1, url2, url3, url4, url5, url6, url7, url8, url9, url10, url11, url12, url13, url14, url15, url16]

photos_url.each do |url|
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    is_guide: false,
    password: "PASSWORD",
    password_confirmation: "PASSWORD"
  })
    user.agency = agency1
    file = URI.open(url)
    user.photo.attach(io: file, filename: "#{user.last_name}-1")
    user.save!
    fake_users << user
end

#Seed of category
category1 = Category.new({
  name: "Neighborhood"
})
category1.save!

category2 = Category.new({
  name: "Museum"
})
category2.save!

category3 = Category.new({
  name: "Monument"
})
category3.save!

categories = [category1, category2, category3]

#Seed of offers

offer1 = Offer.new({
  address: "R. Fazenda Velha",
  description: "The Amazon rainforest, alternatively, the Amazon jungle or Amazonia, is a moist broadleaf tropical rainforest in the Amazon biome that covers most of the Amazon basin of South America. This basin encompasses 7,000,000 km2 (2,700,000 sq mi), of which 5,500,000 km2 (2,100,000 sq mi) are covered by the rainforest. This region includes territory belonging to nine nations and 3,344 formally acknowledged indigenous territories. ",
  video_type: "Both",
  city: "Belem",
  title: "Amazonia",
  price: rand(5.0..10.0).round(1)
})

offer1.user = raph
offer1.category = category1

file = URI.open("https://www.souriya.fr/wp-content/uploads/2020/10/mata-atlantica-atlantic-forest-in-brazil-royalty-free-image-935746242-1567619461.jpg")
offer1.photos.attach(io: file, filename: "#{offer1.title}-1")

file = URI.open("https://www.furosystems.com/wp-content/uploads/2020/06/amazon-rainforest.jpg")
offer1.photos.attach(io: file, filename: "#{offer1.title}-2")

file = URI.open("https://static.dw.com/image/40320815_101.jpg")
offer1.photos.attach(io: file, filename: "#{offer1.title}-3")

offer1.save!

offer2 = Offer.new({
  address: "C14, Talek, Kenya",
  description: "Maasai Mara, also sometimes spelled Masai Mara and locally known simply as The Mara, is a large national game reserve in Narok, Kenya, contiguous with the Serengeti National Park in Tanzania. It is named in honor of the Maasai people, the ancestral inhabitants of the area, who migrated to the area from the Nile Basin. Their description of the area when looked at from afar: Mara means spotted in the local Maasai language, due to the many short bushy trees which dot the landscape. ",
  video_type: "Live",
  city: "Talek",
  title: "Masai Mara National Reserve",
  price: rand(5.0..10.0).round(1)
})

offer2.user = raph
offer2.category = category1
file = URI.open("https://cdn.getyourguide.com/img/location/5d2c5760b47fd.jpeg/88.jpg")
offer2.photos.attach(io: file, filename: "#{offer2.title}-1")

file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/e1/8a/69/the-animals-in-the-wild.jpg?w=1000&h=600&s=1")
offer2.photos.attach(io: file, filename: "#{offer2.title}-2")

file = URI.open("https://www.bouger-voyager.com/wp-content/uploads/2021/01/137260408_m.jpg")
offer2.photos.attach(io: file, filename: "#{offer2.title}-3")
offer2.save!

offer3 = Offer.new({
  address: "Boulevard des plages, Biarritz",
  description: "Biarritz is a city on the Bay of Biscay, on the Atlantic coast in the Pyrénées-Atlantiques department in the French Basque Country in southwestern France. It is located 35 kilometres (22 mi) from the border with Spain. It is a luxurious seaside tourist destination known for the Hôtel du Palais (originally built for the Empress Eugénie circa 1855), its casinos in front of the sea and its surfing culture. ",
  video_type: "Live",
  city: "Biarritz",
  title: "Sables d'or",
  price: rand(5.0..10.0).round(1)
})

offer3.user = nico
offer3.category = category1
file = URI.open("https://tourisme.biarritz.fr/sites/default/files/grande_plage_biarritz.jpg")
offer3.photos.attach(io: file, filename: "#{offer3.title}-1")

file = URI.open("https://tourisme.biarritz.fr/sites/default/files/Plage%20Miramar%201.jpg")
offer3.photos.attach(io: file, filename: "#{offer3.title}-2")

file = URI.open("https://www.biarritz-pays-basque.com/wp-content/uploads/2019/05/plages-en-famille-3-jpg.jpg")
offer3.photos.attach(io: file, filename: "#{offer3.title}-3")
offer3.save!

offer4 = Offer.new({
  address: "1 Av. de la Plage, 64200 Biarritz",
  description: "Arcangues, rendu célèbre par LUIS MARIANO, est un magnifique village vallonné qui a le charme d'un décor d'opérette. It is a commune in the Pyrénées-Atlantiques department in the Nouvelle-Aquitaine region of southwestern France in what was formerly the Basque province of Labourd. ",
  video_type: "Live",
  city: "Arcangues",
  title: "Arcangues",
  price: rand(5.0..10.0).round(1)
})

offer4.user = nico
offer4.category = category1
file = URI.open("https://www.barnes-cotebasque.com/uploads/posts/24/pictures/2775/show_detail.jpg?1605257263")
offer4.photos.attach(io: file, filename: "#{offer4.title}-1")

file = URI.open("https://www.mediabask.eus/media/asset_publics/resources/000/855/264/article_main_landscape/chateau.jpg")
offer4.photos.attach(io: file, filename: "#{offer4.title}-2")

file = URI.open("https://images.ctfassets.net/zfxytrk6nf7m/20KMrrsQdzSwAN63TM0W64/076628d9b1b0e8ed30db30a7b2bd291d/17-04-21-Corpo-Golf-Darcangues-20-03-46-1280.jpg?q=90&fl=progressive&fit=fill")
offer4.photos.attach(io: file, filename: "#{offer4.title}-3")
offer4.save!

offer5 = Offer.new({
  address: "8 Rue de Montpensier, 75001 Paris",
  description: "The Palais-Royal is a former royal palace located in the 1st arrondissement of Paris, France. The screened entrance court faces the Place du Palais-Royal, opposite the Louvre. Originally called the Palais-Cardinal, it was built for Cardinal Richelieu from about 1633 to 1639 by the architect Jacques Lemercier. Richelieu bequeathed it to Louis XIII, and Louis XIV gave it to his younger brother, the Duke of Orléans. As the succeeding dukes of Orléans made such extensive alterations over the years, almost nothing remains of Lemercier's original design. ",
  video_type: "Both",
  city: "Paris",
  title: "Palais Royal",
  price: rand(5.0..10.0).round(1)
})


offer5.user = julien
offer5.category = category1
file = URI.open("https://vivreparis.fr/wp-content/uploads/2021/03/palais-royal-paris.jpg")
offer5.photos.attach(io: file, filename: "#{offer5.title}-1")

file = URI.open("https://www.carigami.fr/magazine/wp-content/uploads/2017/11/paris-palais-royal-colonnes-buren.jpg")
offer5.photos.attach(io: file, filename: "#{offer5.title}-2")

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/ce/Jardins_du_Palais_Royal.JPG")
offer5.photos.attach(io: file, filename: "#{offer5.title}-3")
offer5.save!

offer6 = Offer.new({
  address: "704 Dorsoduro, Venice",
  description: "The Peggy Guggenheim Collection is a modern art museum on the Grand Canal in the Dorsoduro sestiere of Venice, Italy. It is one of the most visited attractions in Venice. The collection is housed in the Palazzo Venier dei Leoni, an 18th-century palace, which was the home of the American heiress Peggy Guggenheim for three decades. She began displaying her private collection of modern artworks to the public seasonally in 1951. After her death in 1979, it passed to the Solomon R. Guggenheim Foundation, which opened the collection year-round from 1980.",
  video_type: "Live",
  city: "Venise",
  title: "Guggenheim Museum",
  price: rand(5.0..10.0).round(1)
})

offer6.user = julien
offer6.category = category2
file = URI.open("https://cdn.getyourguide.com/img/tour/5e9d64e06a79f.jpeg/146.jpg")
offer6.photos.attach(io: file, filename: "#{offer6.title}-1")

file = URI.open("https://les-bons-plans-de-venise.com/wp-content/uploads/2019/08/Guggenheim_08-1024x662-1024x662.jpg")
offer6.photos.attach(io: file, filename: "#{offer6.title}-2")

file = URI.open("https://media.zonzofox.com/cities/venezia/geoplaces/poi/800x400/venezia-collezione-peggy-guggenheim.jpg")
offer6.photos.attach(io: file, filename: "#{offer6.title}-3")
offer6.save!



offer7 = Offer.new({
  address: "Place de l'étoile, Paris",
  description: "Place Charles de Gaulle historically known as the Place de l'Étoile (French: [plas də letwal]), is a large road junction in Paris, France, the meeting point of twelve straight avenues (hence its historic name, which translates as Square of the Star) including the Champs-Élysées. It was renamed in 1970 following the death of President Charles de Gaulle. It is still often referred to by its original name; the nearby Métro and RER station retains the designation Charles de Gaulle–Étoile.",
  video_type: "Both",
  city: "Paris",
  title: "Arc de Triomphe",
  price: rand(5.0..10.0).round(1)
})

offer7.user = antho
offer7.category = category3
file = URI.open("https://www.sortiraparis.com/images/80/1467/523194-visuel-paris-arc-de-triomphe.jpg")
offer7.photos.attach(io: file, filename: "#{offer7.title}-1")

file = URI.open("https://images.rtl.fr/~c/770v513/rtl/www/1480131-le-drapeau-de-l-europe-deploye-sous-l-arc-de-triomphe.jpg")
offer7.photos.attach(io: file, filename: "#{offer7.title}-2")

file = URI.open("https://www.connaissancedesarts.com/wp-content/thumbnails/uploads/2021/09/sans-titre-2021-09-20t124748-156-tt-width-970-height-545-fill-1-crop-0-bgcolor-ffffff.jpg")
offer7.photos.attach(io: file, filename: "#{offer7.title}-3")
offer7.save!

offer8 = Offer.new({
  address: "Rue de Rivoli, Paris",
  description: "The Louvre or the Louvre Museum, is the world's most-visited museum, and a historic landmark in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement (district or ward). At any given point in time, approximately 38,000 objects from prehistory to the 21st century are being exhibited over an area of 72,735 square meters.",
  video_type: "Both",
  city: "Paris",
  title: "Le Louvre",
  price: rand(5.0..10.0).round(1)
})

offer8.user = antho
offer8.category = category2
file = URI.open("https://api-www.louvre.fr/sites/default/files/2021-01/cour-napoleon-et-pyramide_1.jpg")
offer8.photos.attach(io: file, filename: "#{offer8.title}-1")

file = URI.open("https://api-www.louvre.fr/sites/default/files/2021-03/la-grande-galerie.jpg")
offer8.photos.attach(io: file, filename: "#{offer8.title}-2")

file = URI.open("https://cdn.getyourguide.com/img/tour/5d4c31d4123d3.jpeg/99.jpg")
offer8.photos.attach(io: file, filename: "#{offer8.title}-3")
offer8.save!


offer9 = Offer.new({
  address: "Rue Beaubourg, Paris",
  description: "The Centre Pompidou, more fully the Centre national d'art et de culture Georges-Pompidou, also known as the Pompidou Centre in English, is a complex building in the Beaubourg area of the 4th arrondissement of Paris, near Les Halles, rue Montorgueil, and the Marais. It was designed in the style of high-tech architecture by the architectural team of Richard Rogers, Su Rogers, Renzo Piano, along with Gianfranco Franchini.",
  video_type: "Both",
  city: "Paris",
  title: "Le Centre Pompidou",
  price: rand(5.0..10.0).round(1)
})

offer9.user = antho
offer9.category = category2
file = URI.open("https://www.centrepompidou.fr/media/picture/f4/f6/f4f6b50e5f2f95fcfb0aca428c12583d/thumb_large.jpg")
offer9.photos.attach(io: file, filename: "#{offer9.title}-1")

file = URI.open("https://media.lesechos.com/api/v1/images/view/5ca44cdc3e454605f4225865/1280x720/0601006628268-web-tete.jpg")
offer9.photos.attach(io: file, filename: "#{offer9.title}-2")

file = URI.open("https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/f/e/c/fec811f655_41848_5390906463-97075f60ab-b.jpg")
offer9.photos.attach(io: file, filename: "#{offer9.title}-3")
offer9.save!


offer10 = Offer.new({
  address: "Praia da Urca, Rio de Janeiro",
  description: "Sugarloaf Mountain is a peak situated in Rio de Janeiro, Brazil, at the mouth of Guanabara Bay on a peninsula that juts out into the Atlantic Ocean. Rising 396 m (1,299 ft) above the harbor, its name is said to refer to its resemblance to the traditional shape of concentrated refined loaf sugar. It is known worldwide for its cableway and panoramic views of the city and beyond.",
  video_type: "VoD",
  city: "Rio de Janeiro",
  title: "Pão de Açúcar",
  price: rand(5.0..10.0).round(1)
})

offer10.user = antho
offer10.category = category3
file = URI.open("https://cdn.pixabay.com/photo/2014/10/22/20/50/sugar-loaf-pao-de-acucar-498931_960_720.jpg")
offer10.photos.attach(io: file, filename: "#{offer10.title}-1")

file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIgkZUFoV9To9rcz7eVwRzsSMCxiUD0UhmUw&usqp=CAU")
offer10.photos.attach(io: file, filename: "#{offer10.title}-2")

file = URI.open("https://img.locationscout.net/images/2017-09/pao-de-acucar-brazil_l.jpeg")
offer10.photos.attach(io: file, filename: "#{offer10.title}-3")
offer10.save!

offer11 = Offer.new({
  address: "Alto da Boa Vista, Rio de Janeiro",
  description: "Corcovado which means hunchback in Portuguese,[1] is a mountain in central Rio de Janeiro, Brazil. It is a 710-metre granite peak located in the Tijuca Forest, a national park. Corcovado hill lies just west of the city center but is wholly within the city limits and visible from great distances. It is known worldwide for the 38-metre statue of Jesus atop its peak, entitled Christ the Redeemer, which was voted as one of the New Seven Wonders of the World. ",
  video_type: "Both",
  city: "Rio de Janeiro",
  title: "Corcovado",
  price: rand(5.0..10.0).round(1)
})

offer11.user = julien
offer11.category = category3
file = URI.open("https://dfz61940ba5vp.cloudfront.net/wp-content/uploads/2014/10/10131924/Corcovado.jpg")
offer11.photos.attach(io: file, filename: "#{offer11.title}-1")

file = URI.open("https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/29/14.jpg")
offer11.photos.attach(io: file, filename: "#{offer11.title}-2")

file = URI.open("https://media.tacdn.com/media/attractions-splice-spp-674x446/09/9c/cc/57.jpg")
offer11.photos.attach(io: file, filename: "#{offer11.title}-3")
offer11.save!

offer12 = Offer.new({
  address: "Praia de Copacabana, rio de Janeiro",
  description: "Copacabana is a bairro (neighbourhood) located in the South Zone of the city of Rio de Janeiro, Brazil. It is most prominently known for its 4 km (2.5 miles) balneario beach, which is one of the most famous in the world. ",
  video_type: "VoD",
  city: "Rio de Janeiro",
  title: "Copacabana",
  price: rand(5.0..10.0).round(1)
})

offer12.user = julien
offer12.category = category1
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/57/8a/a2/copacabana.jpg?w=1000&h=800&s=1")
offer12.photos.attach(io: file, filename: "#{offer12.title}-1")

file = URI.open("https://imgs-akamai.mnstatic.com/77/d2/77d2558a5cb5f05e0d73e89f9c2774dc.jpg?quality=75&format=pjpg&fit=bounds&width=980&height=880")
offer12.photos.attach(io: file, filename: "#{offer12.title}-2")

file = URI.open("https://img.itinari.com/pages/images/original/2592f836-c717-4e8a-83cc-13ce934834c8-istock-473089840.jpg?ch=DPR&dpr=2.625&w=1200&h=800&s=a5859b88c58b458d3861ce979bb3dcd7")
offer12.photos.attach(io: file, filename: "#{offer12.title}-3")
offer12.save!

offer13 = Offer.new({
  address: "Quai d'Orsay, Paris",
  description: "The Musée d'Orsay is a museum in Paris, France, on the Left Bank of the Seine. It is housed in the former Gare d'Orsay, a Beaux-Arts railway station built between 1898 and 1900. The museum holds mainly French art dating from 1848 to 1914, including paintings, sculptures, furniture, and photography. It houses the largest collection of Impressionist and post-Impressionist masterpieces in the world, by painters including Berthe Morisot, Monet, Manet, Degas, Renoir, Cézanne, Seurat, Sisley, Gauguin, and Van Gogh.",
  video_type: "Live",
  city: "Paris",
  title: "Musée d'Orsay",
  price: rand(5.0..10.0).round(1)
})

offer13.user = nico
offer13.category = category2
file = URI.open("https://www.sortiraparis.com/images/58/83517/421527-visuel-paris-musee-d-orsay.jpg")
offer13.photos.attach(io: file, filename: "#{offer13.title}-1")

file = URI.open("https://media.timeout.com/images/105581784/image.jpg")
offer13.photos.attach(io: file, filename: "#{offer13.title}-2")

file = URI.open("https://www.connaissancedesarts.com/wp-content/thumbnails/uploads/2020/03/cda2020_musee_d_orsay_don_20_millions_d_euros-tt-width-1200-height-630-fill-0-crop-1-bgcolor-ffffff.jpg")
offer13.photos.attach(io: file, filename: "#{offer13.title}-3")
offer13.save!

offer14 = Offer.new({
  address: "Millbank",
  description: "Tate Britain, known from 1897 to 1932 as the National Gallery of British Art and from 1932 to 2000 as the Tate Gallery, is an art museum on Millbank in the City of Westminster in London, England.[3] It is part of the Tate network of galleries in England, with Tate Modern, Tate Liverpool and Tate St Ives. It is the oldest gallery in the network, having opened in 1897.[4][5] It houses a substantial collection of the art of the United Kingdom since Tudor times, and in particular has large holdings of the works of J. M. W. Turner, who bequeathed all his own collection to the nation.",
  video_type: "Both",
  city: "Londres",
  title: "Tate Museum",
  price: rand(5.0..10.0).round(1)
})

offer14.user = nico
offer14.category = category2
file = URI.open("https://blog.direct-d-sign.com/wp-content/uploads/2008/12/Tate-Modern-London.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-1")

file = URI.open("https://i.f1g.fr/media/madame/1900x1900_crop/sites/default/files/img/2016/06/1000x1000.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-2")

file = URI.open("https://cdn.londonandpartners.com/asset/0b22ccc16e730f88bce83d19d86f2ca1.jpg")
offer14.photos.attach(io: file, filename: "#{offer14.title}-3")
offer14.save!

offer15 = Offer.new({
  address: "House of commons",
  description: "Big Ben is the nickname for the Great Bell of the striking clock at the north end of the Palace of Westminster in London, England,[1] although the name is frequently extended to refer also to the clock and the clock tower.[2] The official name of the tower in which Big Ben is located was originally the Clock Tower, but it was renamed Elizabeth Tower in 2012, to mark the Diamond Jubilee of Elizabeth II.",
  video_type: "VoD",
  city: "Londres",
  title: "Big Ben",
  price: rand(5.0..10.0).round(1)
})

offer15.user = raph
offer15.category = category3
file = URI.open("https://fac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FFAC.2Fvar.2Ffemmeactuelle.2Fstorage.2Fimages.2Factu.2Fnews-actu.2Fbig-ben-londres-42286.2F14653510-1-fre-FR.2Fla-celebre-cloche-big-ben-a-londres-ne-sonne-plus.2Ejpg/750x562/quality/80/crop-from/center/cr/wqkgSXN0b2NrIC8gRmVtbWUgQWN0dWVsbGU%3D/la-celebre-cloche-big-ben-a-londres-ne-sonne-plus.jpeg")
offer15.photos.attach(io: file, filename: "#{offer15.title}-1")

file = URI.open("https://cdn.radiofrance.fr/s3/cruiser-production/2017/08/3650420d-0fa3-4719-b2e2-829695eb47c8/1280x680_075_pezzali-notitle170814_nprjn.jpg")
offer15.photos.attach(io: file, filename: "#{offer15.title}-2")

file = URI.open("https://geo.img.pmdstatic.net/fit/https.3A.2F.2Fi.2Epmdstatic.2Enet.2Fgeo.2F2021.2F12.2F21.2F5d2df5d2-15e6-4190-b1af-c90880cd2cd5.2Ejpeg/1200x630/cr/wqkgYWh1bmR0IC8gUGl4YWJheSAvIEdFTw%3D%3D/a-londres-big-ben-sonnera-pour-le-nouvel-an-avant-la-fin-de-sa-restauration.jpg")
offer15.photos.attach(io: file, filename: "#{offer15.title}-3")
offer15.save!

offer16 = Offer.new({
  address: "20 Deans Yd",
  description: "Westminster Abbey, formally titled the Collegiate Church of Saint Peter at Westminster, is a large, mainly Gothic abbey church in the City of Westminster, London, England, just to the west of the Palace of Westminster. It is one of the United Kingdom's most notable religious buildings and the traditional place of coronation and a burial site for English and, later, British monarchs.",
  video_type: "Live",
  city: "Londres",
  title: "Westminster Abbey",
  price: rand(5.0..10.0).round(1)
})

offer16.user = raph
offer16.category = category3
file = URI.open("https://cdn.londonandpartners.com/asset/westminster-abbey_westminster-abbey-copyright-shutterstock-image-courtesy-of-shutterstock_9ac64ccf26eadb50669d288736e98f65.jpg")
offer16.photos.attach(io: file, filename: "#{offer16.title}-1")

file = URI.open("https://media.istockphoto.com/photos/westminster-abbey-in-westminster-london-england-uk-picture-id1189247818?k=20&m=1189247818&s=170667a&w=0&h=gnAix7LIsGh_9UPh82Du1j7vfmK3a4tl_8cV5GltIJs=")
offer16.photos.attach(io: file, filename: "#{offer16.title}-2")

file = URI.open("https://www.clondres.com/wp-content/uploads/sites/5/2018/03/interieur-westminster-abbaye.jpg")
offer16.photos.attach(io: file, filename: "#{offer16.title}-3")
offer16.save!

offer17 = Offer.new({
  address: "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001, Inde",
  description: "The Taj Mahal is an ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan (r. 1628–1658) to house the tomb of his favourite wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself.",
  video_type: "Live",
  city: "Agra",
  title: "Taj Mahal",
  price: rand(5.0..10.0).round(1)
})

offer17.user = raph
offer17.category = category3
file = URI.open("https://static.nationalgeographic.fr/files/styles/image_3200/public/taj-mahal.jpg?w=1600")
offer17.photos.attach(io: file, filename: "#{offer17.title}-1")

file = URI.open("https://www.costacroisieres.fr/content/dam/costa/costa-magazine/article-images/f1f6595/india.jpg")
offer17.photos.attach(io: file, filename: "#{offer17.title}-2")

file = URI.open("https://lyonsecret.com/wp-content/uploads/2020/04/thetajmahali.jpg")
offer17.photos.attach(io: file, filename: "#{offer17.title}-3")
offer17.save!


offer18 = Offer.new({
  address: "Saadiyat - Abu Dhabi - Émirats arabes unis",
  description: "The Louvre Abu Dhabi is an art museum located on Saadiyat Island in Abu Dhabi, United Arab Emirates. It runs under an agreement between the UAE and France, signed in March 2007, that allows it to use the Louvre's name until 2037, and has been described by the Louvre as France’s largest cultural project abroad.",
  video_type: "Live",
  city: "Abu Dhabi",
  title: "Louvre Abu Dhabi",
  price: rand(5.0..10.0).round(1)
})

offer18.user = nico
offer18.category = category2
file = URI.open("https://www.amc-archi.com/mediatheque/8/0/3/000292308/photo-11259-699926-k2-k1-1671449-jpg.jpg")
offer18.photos.attach(io: file, filename: "#{offer18.title}-1")

file = URI.open("https://www.voyageway.com/wp-content/uploads/2019/10/louvre-abu-dhabi.jpg")
offer18.photos.attach(io: file, filename: "#{offer18.title}-2")

file = URI.open("https://medias.exotismes.fr/images/produit/27450/louvre-abu-dhabi-h-c-063-slide.jpg")
offer18.photos.attach(io: file, filename: "#{offer18.title}-3")
offer18.save!

offer19 = Offer.new({
  address: "Temple St, Jordan, Hong Kong",
  description: "Temple Street is a street located in the areas of Jordan and Yau Ma Tei in Kowloon, Hong Kong. It is known for its night market and as one of the busiest flea markets at night in the territory. The night market lies in the Yau Ma Tei, Jordan part of the street. Popular with tourists and locals alike in the evening, it is also common to see the place crowded at dusk. It sells cheap merchandise and food items.",
  video_type: "Live",
  city: "Hong Kong",
  title: "Temple Street Market",
  price: rand(5.0..10.0).round(1)
})

offer19.user = julien
offer19.category = category1
file = URI.open("https://media.istockphoto.com/photos/neon-signs-in-hongkong-china-at-night-picture-id1089667668?k=20&m=1089667668&s=612x612&w=0&h=LgsYUEkHyCWzxqkjNWH9-OZ2N01n_MTiHS7Px3a_i7I=")
offer19.photos.attach(io: file, filename: "#{offer19.title}-1")

file = URI.open("https://media.timeout.com/images/105643791/750/562/image.jpg")
offer19.photos.attach(io: file, filename: "#{offer19.title}-2")

file = URI.open("https://previews.123rf.com/images/javarman/javarman1807/javarman180700045/104797734-temple-street-night-market-in-hong-kong.jpg")
offer19.photos.attach(io: file, filename: "#{offer19.title}-3")
offer19.save!




offer20 = Offer.new({
  address: "Museumstraat 1, Amsterdam, Netherlands",
  description: "The Rijksmuseum is the national museum of the Netherlands dedicated to Dutch arts and history and is located in Amsterdam.[10] The museum is located at the Museum Square in the borough Amsterdam South, close to the Van Gogh Museum, the Stedelijk Museum Amsterdam, and the Concertgebouw.",
  video_type: "Both",
  city: "Amsterdam",
  title: "Rijksmuseum",
  price: rand(5.0..10.0).round(1)
})

offer20.user = antho
offer20.category = category2
file = URI.open("https://cdn.getyourguide.com/img/tour/5db0759f4ad16.jpeg/148.jpg")
offer20.photos.attach(io: file, filename: "#{offer20.title}-1")

file = URI.open("https://cms-assets.jung.de/cms/media/39/3967/980x496/standard/rijksmuseum-amsterdam-16.jpg")
offer20.photos.attach(io: file, filename: "#{offer20.title}-2")

file = URI.open("https://bons-plans-amsterdam.com/wp-content/uploads/2019/04/Rijksmuseum03-1024x683.jpg")
offer20.photos.attach(io: file, filename: "#{offer20.title}-3")
offer20.save!



offer21 = Offer.new({
  address: "Giza, Greater Cairo, Egypt",
  description: "The Giza pyramid complex, also called the Giza necropolis, is the site on the Giza Plateau in Greater Cairo, Egypt that includes the Great Pyramid of Giza, the Pyramid of Khafre, and the Pyramid of Menkaure, along with their associated pyramid complexes and the Great Sphinx of Giza. All were built during the Fourth Dynasty of the Old Kingdom of Ancient Egypt, between 2600 and 2500 BC.",
  video_type: "Both",
  city: "Cairo",
  title: "Giza Pyramid",
  price: rand(5.0..10.0).round(1)
})

offer21.user = nico
offer21.category = category3
file = URI.open("https://i.natgeofe.com/n/535f3cba-f8bb-4df2-b0c5-aaca16e9ff31/giza-plateau-pyramids_2x1.jpg")
offer21.photos.attach(io: file, filename: "#{offer21.title}-1")

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Kheops-Pyramid.jpg/1200px-Kheops-Pyramid.jpg")
offer21.photos.attach(io: file, filename: "#{offer21.title}-2")

file = URI.open("https://media.architecturaldigest.com/photos/58e2a407c0e88d1a6a20066b/2:1/w_1287,h_643,c_limit/Pyramid%20of%20Giza%201.jpg")
offer21.photos.attach(io: file, filename: "#{offer21.title}-3")
offer21.save!


video_type = ["Live", "VoD", "Both"]

offers = [offer1, offer2, offer3, offer4, offer5, offer6, offer7, offer8, offer9, offer10, offer11, offer12, offer13, offer14, offer15, offer16, offer17, offer18, offer19, offer20, offer21]

offers_for_seeds = [offer2, offer3, offer4, offer5, offer6, offer7, offer8, offer9, offer10, offer11, offer12, offer13, offer14, offer15, offer16, offer17, offer18, offer19, offer20, offer21]


#Seed of slots + chatrooms

slots = []

offers_for_seeds.each do |offer|
  date = DateTime.new(2022, rand(1..5), rand(1..28), rand(0..23), [0, 30].sample)
  slot = Slot.new({ start_at: date })
  slot.offer = offer
  slot.user = agents.sample
  slot.save!
  slots << slot

  chatroom = Chatroom.new
  chatroom.slot = slot
  chatroom.save!
end

#Seed slot Amazonia pour pitch
date = DateTime.new(2022, 3, 11, 17, 30)
slot = Slot.new({ start_at: date })
slot.offer = offer1
slot.user = agents.sample
slot.save!
chatroom = Chatroom.new
chatroom.slot = slot
chatroom.save!


#Seed for user Anthony

offers1 = [offer2, offer3, offer4, offer5, offer6, offer7]

offers2 = [offer18, offer19, offer20, offer21]

offers1.each do |offer|
  date = DateTime.new(2022, rand(1..2), rand(1..28), rand(0..23), [0, 30].sample)
  slot = Slot.new({ start_at: date })
  slot.offer = offer
  slot.user = agents.sample
  slot.save!
  rental = Rental.new
  rental.user = nico
  rental.slot = slot
  rental.save!
  chatroom = Chatroom.new
  chatroom.slot = slot
  chatroom.save!
end

offers2.each do |offer|
  date = DateTime.new(2022, rand(3..6), rand(11..30), rand(0..23), [0, 30].sample)
  slot = Slot.new({ start_at: date })
  slot.offer = offer
  slot.user = agents.sample
  slot.save!
  rental = Rental.new
  rental.user = nico
  rental.slot = slot
  rental.save!
  chatroom = Chatroom.new
  chatroom.slot = slot
  chatroom.save!
end


#Seed of rentals for other users

130.times do
  rental = Rental.new
  rental.user = fake_users.sample
  rental.slot = slots.sample
  rental.save!
end


#Seed of reviews

# 400.times do
#   review = Review.new({
#   content: Faker::Lorem.sentences(number: 2),
#   rating: rand(1..5)
#   })
#   review.rental = rentals.sample
#   review.save!
# end

#Seed of flashcards

250.times do
  flashcard = Flashcard.new({
    question: Faker::Lorem.sentences(number: 1),
    answer: Faker::Lorem.sentences(number: 2)
  })
  flashcard.offer = offers.sample
  flashcard.save!
end






####################"LOOGING THE RESULTS FOR TESTING"#############
puts "#############BEGGINING OF TESTS FOLLOWING SEED IMPLEMENTATION############"
p ""
p ""

p "-----------TEST IF SEED HAS BEEN ADDED----------"

puts "------------------Agency------------------"
agencies = Agency.all
p agencies
puts "-------------------------------------------"
puts ""

puts "------------------USERS------------------"
users = User.all
p users
puts "-------------------------------------------"
puts ""


puts "------------------OFFERS------------------"
offers = Offer.all
p offers
puts "-------------------------------------------"
puts ""

puts "------------------CATEGORIES------------------"
categories = Category.all
p categories
puts "-------------------------------------------"
puts ""

puts "------------------SLOTS------------------"
slots = Slot.all
p slots
puts "-------------------------------------------"
puts ""

puts "------------------RENTALS------------------"
rentals = Rental.all
p rentals
puts "-------------------------------------------"
puts ""

# puts "------------------REVIEWS------------------"
# reviews = Review.all
# p reviews
# puts "-------------------------------------------"
# puts ""


puts "------------------Flashcard------------------"
flashcards = Flashcard.all
p flashcards
puts "-------------------------------------------"
puts ""


p "-----------TEST OF THROUGH and other Active record----------"


p "-----------TEST OF Active records ----------"
# to be completed

puts "#########END OF TEST#########"
